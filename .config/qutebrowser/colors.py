BLACK = "#425059"
RED = "#cc6666"
GREEN = "#b5bd68"
YELLOW = "#f0c674"
BLUE = "#81a2be"
MAGENTA = "#b294bb"
CYAN = "#8abeb7"
WHITE = "#c5c8c6"

BRBLACK = "#2d3c46"
BRRED = "#a54242"
BRGREEN = "#8c9440"
BRYELLOW = "#de935f"
BRBLUE = "#5f819d"
BRMAGENTA = "#85678f"
BRCYAN = "#5e8d87"
BRWHITE = "#6c7a80"

DIMBLACK = "rgba(42, 50, 59, 30%)"
DIMRED = "rgba(cc, 66, 66, 70%)"
DIMGREEN = "rgba(b5, bd, 68, 70%)"
DIMYELLOW = "rgba(f0, c6, 74, 70%)"
DIMBLUE = "rgba(81, a2, be, 70%)"
DIMMAGENTA = "rgba(b2, 94, bb, 70%)"
DIMCYAN = "rgba(8a, be, b7, 70%)"
DIMWHITE = "rgba(c5, c8, c6, 70%)"


# Gradients: f"qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 {BRBLACK}, stop:1 {BLACK})"

def set_colors(c, config):

    ## Completion header
    c.colors.completion.category.bg = BLACK
    c.colors.completion.category.border.bottom = BLUE
    c.colors.completion.category.border.top = BLUE
    c.colors.completion.category.fg = BLUE

    ## Completion body
    c.colors.completion.even.bg = BRBLACK
    c.colors.completion.odd.bg = BRBLACK
    # [command, description, mapping]
    c.colors.completion.fg = [WHITE, BLUE, BRWHITE]

    ## Completion selected item
    c.colors.completion.item.selected.bg = BLUE
    c.colors.completion.item.selected.border.bottom = BRBLUE
    c.colors.completion.item.selected.border.top = BRBLUE
    c.colors.completion.item.selected.fg = BRBLACK

    ## Completion match
    c.colors.completion.item.selected.match.fg = RED
    c.colors.completion.match.fg = RED

    ## Completion Scrollbar
    c.colors.completion.scrollbar.bg = BLACK
    c.colors.completion.scrollbar.fg = WHITE

    ## Context menu
    c.colors.contextmenu.menu.bg = BLACK
    c.colors.contextmenu.menu.fg = WHITE
    c.colors.contextmenu.selected.bg = BLUE
    c.colors.contextmenu.selected.fg = BRBLACK

    ## Download bar.
    c.colors.downloads.bar.bg = BLACK
    c.colors.downloads.error.bg = RED
    c.colors.downloads.error.fg = BRBLACK
    c.colors.downloads.start.bg = BLUE
    c.colors.downloads.start.fg = BRBLACK
    c.colors.downloads.stop.bg = GREEN
    c.colors.downloads.stop.fg = BRBLACK

    ## Color gradient interpolation system for download backgrounds.
    ## Type: ColorSystem
    ## Valid values:
    ##   - rgb: Interpolate in the RGB color system.
    ##   - hsv: Interpolate in the HSV color system.
    ##   - hsl: Interpolate in the HSL color system.
    ##   - none: Don't show a gradient.
    # c.colors.downloads.system.bg = 'rgb'

    ## Color gradient interpolation system for download text.
    ## Type: ColorSystem
    ## Valid values:
    ##   - rgb: Interpolate in the RGB color system.
    ##   - hsv: Interpolate in the HSV color system.
    ##   - hsl: Interpolate in the HSL color system.
    ##   - none: Don't show a gradient.
    # c.colors.downloads.system.fg = 'rgb'

    c.colors.hints.fg = YELLOW
    c.colors.hints.bg = BRBLACK
    c.colors.hints.match.fg = BRRED
    c.hints.border = f'3px solid {YELLOW}'

    ## Background color of the keyhint widget.
    ## Type: QssColor
    # c.colors.keyhint.bg = 'rgba(0, 0, 0, 80%)'

    ## Text color for the keyhint widget.
    ## Type: QssColor
    # c.colors.keyhint.fg = '#FFFFFF'

    ## Highlight color for keys to complete the current keychain.
    ## Type: QssColor
    # c.colors.keyhint.suffix.fg = '#FFFF00'

    ## Error messages
    c.colors.messages.error.bg = RED
    c.colors.messages.error.border = BRRED
    c.colors.messages.error.fg = WHITE

    ## Info messages
    c.colors.messages.info.bg = BLACK
    c.colors.messages.info.border = BRBLACK
    c.colors.messages.info.fg = WHITE

    ## Warning messages
    c.colors.messages.warning.bg = MAGENTA
    c.colors.messages.warning.border = BRMAGENTA
    c.colors.messages.warning.fg = WHITE

    ## Background color for prompts.
    ## Type: QssColor
    # c.colors.prompts.bg = '#444444'

    ## Border used around UI elements in prompts.
    ## Type: String
    # c.colors.prompts.border = '1px solid gray'

    ## Foreground color for prompts.
    ## Type: QssColor
    # c.colors.prompts.fg = 'white'

    ## Background color for the selected item in filename prompts.
    ## Type: QssColor
    # c.colors.prompts.selected.bg = 'grey'

    ## Statusbar in caret mode.
    c.colors.statusbar.caret.bg = BRRED
    c.colors.statusbar.caret.fg = WHITE
    c.colors.statusbar.caret.selection.bg = BRMAGENTA
    c.colors.statusbar.caret.selection.fg = WHITE

    ## Statusbar in command mode.
    c.colors.statusbar.command.bg = WHITE
    c.colors.statusbar.command.fg = BRBLACK

    ## Background color of the statusbar in private browsing + command mode.
    ## Type: QssColor
    # c.colors.statusbar.command.private.bg = 'darkslategray'

    ## Foreground color of the statusbar in private browsing + command mode.
    ## Type: QssColor
    # c.colors.statusbar.command.private.fg = 'white'

    ## Background color of the statusbar in insert mode.
    c.colors.statusbar.insert.bg = YELLOW
    c.colors.statusbar.insert.fg = BRBLACK

    ## Background color of the statusbar.
    c.colors.statusbar.normal.bg = BRBLACK
    c.colors.statusbar.normal.fg = WHITE

    ## color of the statusbar in passthrough mode.
    c.colors.statusbar.passthrough.bg = BLUE
    c.colors.statusbar.passthrough.fg = BRBLACK

    ## Background color of the statusbar in private browsing mode.
    # c.colors.statusbar.private.bg = '#666666'

    ## Foreground color of the statusbar in private browsing mode.
    # c.colors.statusbar.private.fg = 'white'

    ## Background color of the progress bar.
    c.colors.statusbar.progress.bg = BLUE

    ## Foreground color of the URL in the statusbar on error.
    c.colors.statusbar.url.error.fg = RED
    c.colors.statusbar.url.fg = WHITE
    c.colors.statusbar.url.hover.fg = CYAN
    c.colors.statusbar.url.success.http.fg = WHITE
    c.colors.statusbar.url.success.https.fg = GREEN

    ## Foreground color of the URL in the statusbar when there's a warning.
    ## Type: QssColor
    # c.colors.statusbar.url.warn.fg = 'yellow'

    ## Background color of the tab bar.
    c.colors.tabs.bar.bg = "black"

    ## Background color of unselected even tabs.
    c.colors.tabs.even.bg = BRBLACK
    c.colors.tabs.even.fg = WHITE
    c.colors.tabs.odd.bg = BRBLACK
    c.colors.tabs.odd.fg = WHITE

    ## Color for the tab indicator on errors.
    c.colors.tabs.indicator.error = RED

    ## Color gradient start for the tab indicator.
    c.colors.tabs.indicator.start = BLUE

    ## Color gradient end for the tab indicator.
    c.colors.tabs.indicator.stop = BLUE

    ## Color gradient interpolation system for the tab indicator.
    ## Type: ColorSystem
    ## Valid values:
    ##   - rgb: Interpolate in the RGB color system.
    ##   - hsv: Interpolate in the HSV color system.
    ##   - hsl: Interpolate in the HSL color system.
    ##   - none: Don't show a gradient.
    # c.colors.tabs.indicator.system = 'rgb'

    ## Background color of pinned unselected even tabs.
    # c.colors.tabs.pinned.even.bg = 'darkseagreen'

    ## Foreground color of pinned unselected even tabs.
    # c.colors.tabs.pinned.even.fg = 'white'

    ## Background color of pinned unselected odd tabs.
    # c.colors.tabs.pinned.odd.bg = 'seagreen'

    ## Foreground color of pinned unselected odd tabs.
    # c.colors.tabs.pinned.odd.fg = 'white'

    ## Background color of pinned selected even tabs.
    # c.colors.tabs.pinned.selected.even.bg = 'black'

    ## Foreground color of pinned selected even tabs.
    # c.colors.tabs.pinned.selected.even.fg = 'white'

    ## Background color of pinned selected odd tabs.
    # c.colors.tabs.pinned.selected.odd.bg = 'black'

    ## Foreground color of pinned selected odd tabs.
    # c.colors.tabs.pinned.selected.odd.fg = 'white'

    ## Background color of selected even tabs.
    c.colors.tabs.selected.even.bg = BLUE

    ## Foreground color of selected even tabs.
    c.colors.tabs.selected.even.fg = BRBLACK

    ## Background color of selected odd tabs.
    c.colors.tabs.selected.odd.bg = BLUE

    ## Foreground color of selected odd tabs.
    c.colors.tabs.selected.odd.fg = BRBLACK

    c.colors.webpage.bg = None
    c.colors.webpage.darkmode.enabled = True
    c.colors.webpage.prefers_color_scheme_dark = True

    # experimental
    # c.colors.webpage.darkmode.algorithm = "lightness-hsl"
