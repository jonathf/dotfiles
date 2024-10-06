import qutebrowser

from mappings import set_mappings
import dracula.draw

# these are provided by Qutebrowser
c: qutebrowser.config.config.ConfigContainer = c
config: qutebrowser.config.configfiles.ConfigAPI = config

try:
    config.load_autoconfig(True)  # new style loading
except:
    config.load_autoconfig()  # old style loading

dracula.draw.blood(c, {
    "spacing": {
        "vertical": 2,
        "horizontal": 0,
    }
})

c.colors.webpage.bg = "black"
c.colors.webpage.darkmode.enabled = True

c.window.transparent = True
c.window.title_format = "{current_title}"
c.window.hide_decoration = False

set_mappings(c, config)

# Load a restored tab as soon as it takes focus.
# Type: Bool
c.session.lazy_restore = True

# Always restore open sites when qutebrowser is reopened. Without this
# option set, `:wq` (`:quit --save`) needs to be used to save open tabs
# (and restore them), while quitting qutebrowser in any other way will
# not save/restore the session. By default, this will save to the
# session which was last loaded. This behavior can be customized via the
# `session.default_name` setting.
# Type: Bool
c.auto_save.session = True

# Automatically start playing `<video>` elements. Note: On Qt < 5.11,
# this option needs a restart and does not support URL patterns.
# Type: Bool
c.content.autoplay = False

# Number of commands to save in the command history. 0: no history / -1:
# unlimited
# Type: Int
c.completion.cmd_history_max_items = 1000

# Delay (in milliseconds) before updating completions after typing a
# character.
# Type: Int
# c.completion.delay = 0

# Height (in pixels or as percentage of the window) of the completion.
# Type: PercOrInt
c.completion.height = 300

# Padding (in pixels) of the scrollbar handle in the completion window.
# Type: Int
c.completion.scrollbar.padding = 0

# Width (in pixels) of the scrollbar in the completion window.
# Type: Int
c.completion.scrollbar.width = 6

# When to show the autocompletion window.
# Type: String
# Valid values:
#   - always: Whenever a completion is available.
#   - auto: Whenever a completion is requested.
#   - never: Never.
c.completion.show = 'auto'

# Shrink the completion to be smaller than the configured size if there
# are no scrollbars.
# Type: Bool
c.completion.shrink = True

# Execute the best-matching command on a partial match.
# Type: Bool
c.completion.use_best_match = False

# Try to pre-fetch DNS entries to speed up browsing.
# Type: Bool
c.content.dns_prefetch = False

# Limit fullscreen to the browser window (does not expand to fill the
# screen).
# Type: Bool
c.content.fullscreen.window = False

# User agent to send. Unset to send the default. Note that the value
# read from JavaScript is always the global value.
# Type: String
# TODO: User Agent extension
# container.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'
c.content.headers.user_agent = 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {qt_key}/{qt_version} {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}'

# Which method of blocking ads should be used. Support for Adblock Plus (ABP) syntax blocklists using Brave’s Rust library requires the adblock Python package to be installed, which is an optional dependency of qutebrowser. It is required when either adblock or both are selected.
# Type: String
# Valid values:
#   - auto: Use Brave’s ABP-style adblocker if available, host blocking otherwise
#   - adblock: Use Brave’s ABP-style adblocker
#   - hosts: Use hosts blocking
#   - both: Use both hosts blocking and Brave’s ABP-style adblocker
# Default: auto
c.content.blocking.method = 'both'

# List of URLs of lists which contain hosts to block.  The file can be
# in one of the following formats:  - An `/etc/hosts`-like file - One
# host per line - A zip-file of any of the above, with either only one
# file, or a file   named `hosts` (with any extension).  It's also
# possible to add a local file or directory via a `file://` URL. In case
# of a directory, all files in the directory are read as adblock lists.
# The file `~/.config/qutebrowser/blocked-hosts` is always read if it
# exists.
# Type: List of Url
c.content.blocking.hosts.lists = [
    'https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts',
    'https://hosts.anudeep.me/mirror/adservers.txt',
]

c.content.blocking.adblock.lists = [
    'https://secure.fanboy.co.nz/r/fanboy-ultimate.txt',
    'https://easylist-downloads.adblockplus.org/advblock.txt',
    'https://raw.githubusercontent.com/hant0508-zz/uBlock-fillters/master/filters.txt',
    'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=adblockplus&showintro=1&mimetype=plaintext',
    'https://easylist-downloads.adblockplus.org/antiadblockfilters.txt',
]

# A list of patterns that should always be loaded, despite being ad-
# blocked. Note this whitelists blocked hosts, not first-party URLs. As
# an example, if `example.org` loads an ad from `ads.example.org`, the
# whitelisted host should be `ads.example.org`. If you want to disable
# the adblocker on a given page, use the `content.host_blocking.enabled`
# setting with a URL pattern instead. Local domains are always exempt
# from hostblocking.
# Type: List of UrlPattern
c.content.blocking.whitelist = [
    '*.reddit.com',
    '*.redditstatic.com',
    '*.redditmedia.com',
    '*.redd.it',
    '*.datadoghq.eu',
    'shared.cdn.smp.schibsted.com',
    '*.awsapps.com',
    '*.awstrack.me',
]


# Enable hyperlink auditing (`<a ping>`).
# Type: Bool
c.content.hyperlink_auditing = True

# Allow JavaScript to read from or write to the clipboard. With
# QtWebEngine, writing the clipboard as response to a user interaction
# is always allowed.
# Type: Bool
c.content.javascript.clipboard = 'none'

# Allow pdf.js to view PDF files in the browser. Note that the files can
# still be downloaded by clicking the download button in the pdf.js
# viewer.
# Type: Bool
c.content.pdfjs = True

# Enable plugins in Web pages.
# Type: Bool
c.content.plugins = True

# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = "~/temp/"

# Prompt the user for the download location. If set to false,
# `downloads.location.directory` will be used.
# Type: Bool
c.downloads.location.prompt = False

# Editor (and arguments) to use for the `open-editor` command. The
# following placeholders are defined:  * `{file}`: Filename of the file
# to be edited. * `{line}`: Line in which the caret is found in the
# text. * `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
c.editor.command = ["alacritty", "-e", "sh", "-c", "sleep 0.1 && nvim {}"]

# Default font size to use. Whenever "default_size" is used in a font
# setting, it's replaced with the size listed here. Valid values are
# either a float value with a "pt" suffix, or an integer value with a
# "px" suffix.
# Type: String
c.fonts.default_size = '11pt'
c.fonts.default_family = "UbuntuMono"

# Mode to use for hints.
# Type: String
# Valid values:
#   - number: Use numeric hints. (In this mode you can also type letters from the hinted element to filter and reduce the number of elements that are hinted.)
#   - letter: Use the characters in the `hints.chars` setting.
#   - word: Use hints words based on the html elements and the extra words.
c.hints.mode = 'letter'

# Rounding radius (in pixels) for the edges of hints.
# Type: Int
c.hints.radius = 6

# Scatter hint key chains (like Vimium) or not (like dwb). Ignored for
# number hints.
# Type: Bool
c.hints.scatter = False

# Make characters in hint strings uppercase.
# Type: Bool
c.hints.uppercase = True

# Turn on Qt HighDPI scaling. This is equivalent to setting
# QT_AUTO_SCREEN_SCALE_FACTOR=1 or QT_ENABLE_HIGHDPI_SCALING=1 (Qt >=
# 5.14) in the environment. It's off by default as it can cause issues
# with some bitmap fonts. As an alternative to this, it's possible to
# set font sizes and the `zoom.default` setting.
# Type: Bool
c.qt.highdpi = True

# Open new tabs (middleclick/ctrl+click) in the background.
# Type: Bool
c.tabs.background = True

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'left'

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'https://google.com/'

# Search engines which can be used via the address bar.  Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` braces.  The following further
# placeholds are defined to configure how special characters in the
# search terms are replaced by safe characters (called 'quoting'):  *
# `{}` and `{semiquoted}` quote everything except slashes; this is the
# most   sensible choice for almost all search engines (for the search
# term   `slash/and&amp` this placeholder expands to `slash/and%26amp`).
# * `{quoted}` quotes all characters (for `slash/and&amp` this
# placeholder   expands to `slash%2Fand%26amp`). * `{unquoted}` quotes
# nothing (for `slash/and&amp` this placeholder   expands to
# `slash/and&amp`).  The search engine named `DEFAULT` is used when
# `url.auto_search` is turned on and something else than a URL was
# entered to be opened. Other search engines can be used by prepending
# the search engine name to the search term, e.g.  `:open google
# qutebrowser`.
# Type: Dict
c.url.searchengines = {
    'DEFAULT': 'https://google.com/search?q={}',
    'maps': 'https://google.com/maps?q={}',
    'youtube': 'https://www.youtube.com/results?search_query={}',
    'gmail': 'https://mail.google.com/mail/u/0/#search/{}',
}

# Default zoom level.
# Type: Perc
c.zoom.default = '100%'

# Available zoom levels.
# Type: List of Perc
c.zoom.levels = ['50%', '75%', '80%', '100%', '120%', '150%', '200%', '300%']

# config.source("theme.py")
