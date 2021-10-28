function word_under_cursor()
  local column = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local left = line:sub(1, column+1):match("[%w_-]*$")
  local right = line:sub(column+2):match("^[%w_-]*")
  return left..right
end

function open_word_under_cursor()
  local folder = vim.fn.expand("%:p:h").."/"
  local extension ="."..vim.fn.expand("%:e"))
  local filepath = folder..word_under_cursor()..extension
  vim.cmd(":edit "..filepath)
end

local instances = {}

local function open(idx, init)
  if not instances[idx] then
    instances[idx] = new(init)
  end
  instance = instances[idx]
  if api.nvim_win_is_valid(instance.window) then
    goto_window(idx)
  else
    vim.cmd[[:vsplit<cr>]]
  end

end




local config = {
    -- Run the default shell in the terminal
    cmd = os.getenv('SHELL'),
    -- Neovim's native `nvim_open_win` border config
    border = 'single',
    -- Kill the terminal buffer as soon as shell exists
    close_on_kill = true,
    -- Dimensions are treated as percentage
    dimensions = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,
    },
}
local api = vim.api
local fn = vim.fn
local cmd = api.nvim_command

local Terminal = {
    au_close = {},
    au_resize = {},
}

-- Init
function Terminal:new()
    local state = {
        win = nil,
        buf = nil,
        terminal = nil,
    }

    self.__index = self
    return setmetatable(state, self)
end

-- Terminal:setup takes windows configuration ie. dimensions
function Terminal:setup(opts)
    -- Give every terminal instance their own key
    -- by converting the given cmd into a hex string
    -- This is to be used with autocmd
    self.au_key = config.cmd:gsub('.', function(c)
        return string.format('%02X', string.byte(c))
    end)

    self:win_dim()

    -- Need to setup different autocmd for different terminal instances
    -- Otherwise autocmd will be overriden by other terminal aka custom terminal
    Terminal.au_resize[self.au_key] = function()
        self:win_dim()
    end

    cmd("autocmd VimResized * lua require('terminal').au_resize['" .. self.au_key .. "']()")

    return self
end

-- Terminal:remember_cursor stores the last cursor position and window
function Terminal:remember_cursor()
    self.last_win = api.nvim_get_current_win()
    self.last_pos = api.nvim_win_get_cursor(self.last_win)
end

-- Terminal:restore_cursor restores the cursor to the last remembered position
function Terminal:restore_cursor()
    if self.last_win and self.last_pos ~= nil then
        api.nvim_set_current_win(self.last_win)
        api.nvim_win_set_cursor(self.last_win, self.last_pos)

        self.last_win = nil
        self.last_pos = nil
    end
end

-- Terminal:win_dim return window dimensions
function Terminal:win_dim()
    -- get dimensions
    local d = config.dimensions
    local cl = vim.o.columns
    local ln = vim.o.lines

    -- calculate our floating window size
    local width = math.ceil(cl * d.width)
    local height = math.ceil(ln * d.height - 4)

    -- and its starting position
    local col = math.ceil((cl - width) * d.x)
    local row = math.ceil((ln - height) * d.y - 1)

    self.dims = {
        width = width,
        height = height,
        col = col,
        row = row,
    }
end

-- Terminal:create_buf creates a scratch buffer for floating window to consume
function Terminal:create_buf()
    -- If previous buffer exists then return it
    local prev = self.buf

    if prev and api.nvim_buf_is_loaded(prev) then
        return prev
    end

    return api.nvim_create_buf(false, true)
end

-- Terminal:create_win creates a new window with a given buffer
function Terminal:create_win(buf)
    local dim = self.dims

    local win = api.nvim_open_win(buf, true, {
        border = config.border,
        relative = 'editor',
        style = 'minimal',
        width = dim.width,
        height = dim.height,
        col = dim.col,
        row = dim.row,
    })

    api.nvim_win_set_option(win, 'winhl', 'Normal:Normal')

    -- Setting filetype in `create_win()` instead of `create_buf()` because window options
    -- such as `winhl`, `winblend` should be available after the window is created.
    api.nvim_buf_set_option(buf, 'filetype', 'FTerm')

    return win
end

-- Terminal:term opens a terminal inside a buffer
function Terminal:term()
    if not self.buf then
        -- This function fails if the current buffer is modified (all buffer contents are destroyed).
        local pid = fn.termopen(config.cmd)

        -- IDK what to do with this now, maybe later we can use it
        self.terminal = pid

        -- Only close the terminal buffer when `close_on_kill` is true
        if config.close_on_kill then
            -- Need to setup different TermClose autocmd for different terminal instances
            -- Otherwise this will be overriden by other terminal aka custom terminal
            Terminal.au_close[self.au_key] = function()
                self:close(true)
            end

            -- This fires when someone executes `exit` inside term
            -- So, in this case the buffer should also be removed instead of reusing
            cmd("autocmd! TermClose <buffer> lua require('FTerm.terminal').au_close['" .. self.au_key .. "']()")
        end
    end

    cmd('startinsert')
end

-- Terminal:open does all the magic of opening terminal
function Terminal:open()
    self:remember_cursor()

    local buf = self:create_buf()
    local win = self:create_win(buf)
    self:term()
    self.win = win
    self.buf = buf
end

-- Terminal:close does all the magic of closing terminal and clearing the buffers/windows
function Terminal:close(force)
    if not self.win then
        return
    end

    if api.nvim_win_is_valid(self.win) then
        api.nvim_win_close(self.win, {})
    end

    self.win = nil

    if force then
        if api.nvim_buf_is_loaded(self.buf) then
            api.nvim_buf_delete(self.buf, { force = true })
        end

        fn.jobstop(self.terminal)

        self.buf = nil
        self.terminal = nil
    end

    self:restore_cursor()
end

-- Terminal:toggle is used to toggle the terminal window
function Terminal:toggle()
    -- If window is stored then it is already opened
    if not self.win then
        self:open()
    else
        self:close()
    end
end

return Terminal
