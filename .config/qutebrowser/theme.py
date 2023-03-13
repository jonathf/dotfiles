# base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
# Base16 qutebrowser template by theova
# Circus scheme by Stephan Boyer (https://github.com/stepchowfun) and Esther Wang (https://github.com/ewang12)

import qutebrowser

container: qutebrowser.config.config.ConfigContainer = c

base00 = "#191919"
base01 = "#202020"
base02 = "#303030"
base03 = "#5f5a60"
base04 = "#505050"
base05 = "#a7a7a7"
base06 = "#808080"
base07 = "#ffffff"
base08 = "#dc657d"
base09 = "#4bb1a7"
base0A = "#c3ba63"
base0B = "#84b97c"
base0C = "#4bb1a7"
base0D = "#639ee4"
base0E = "#b888e2"
base0F = "#b888e2"

# set qutebrowser colors

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
container.colors.completion.fg = base05

# Background color of the completion widget for odd rows.
container.colors.completion.odd.bg = base01

# Background color of the completion widget for even rows.
container.colors.completion.even.bg = base00

# Foreground color of completion widget category headers.
container.colors.completion.category.fg = base0A

# Background color of the completion widget category headers.
container.colors.completion.category.bg = base00

# Top border color of the completion widget category headers.
container.colors.completion.category.border.top = base00

# Bottom border color of the completion widget category headers.
container.colors.completion.category.border.bottom = base00

# Foreground color of the selected completion item.
container.colors.completion.item.selected.fg = base05

# Background color of the selected completion item.
container.colors.completion.item.selected.bg = base02

# Top border color of the selected completion item.
container.colors.completion.item.selected.border.top = base02

# Bottom border color of the selected completion item.
container.colors.completion.item.selected.border.bottom = base02

# Foreground color of the matched text in the selected completion item.
container.colors.completion.item.selected.match.fg = base0B

# Foreground color of the matched text in the completion.
container.colors.completion.match.fg = base0B

# Color of the scrollbar handle in the completion view.
container.colors.completion.scrollbar.fg = base05

# Color of the scrollbar in the completion view.
container.colors.completion.scrollbar.bg = base00

# Background color of disabled items in the context menu.
container.colors.contextmenu.disabled.bg = base01

# Foreground color of disabled items in the context menu.
container.colors.contextmenu.disabled.fg = base04

# Background color of the context menu. If set to null, the Qt default is used.
container.colors.contextmenu.menu.bg = base00

# Foreground color of the context menu. If set to null, the Qt default is used.
container.colors.contextmenu.menu.fg =  base05

# Background color of the context menu’s selected item. If set to null, the Qt default is used.
container.colors.contextmenu.selected.bg = base02

#Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
container.colors.contextmenu.selected.fg = base05

# Background color for the download bar.
container.colors.downloads.bar.bg = base00

# Color gradient start for download text.
container.colors.downloads.start.fg = base00

# Color gradient start for download backgrounds.
container.colors.downloads.start.bg = base0D

# Color gradient end for download text.
container.colors.downloads.stop.fg = base00

# Color gradient stop for download backgrounds.
container.colors.downloads.stop.bg = base0C

# Foreground color for downloads with errors.
container.colors.downloads.error.fg = base08

# Font color for hints.
container.colors.hints.fg = base00

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
container.colors.hints.bg = base0A

# Font color for the matched part of hints.
container.colors.hints.match.fg = base05

# Text color for the keyhint widget.
container.colors.keyhint.fg = base05

# Highlight color for keys to complete the current keychain.
container.colors.keyhint.suffix.fg = base05

# Background color of the keyhint widget.
container.colors.keyhint.bg = base00

# Foreground color of an error message.
container.colors.messages.error.fg = base00

# Background color of an error message.
container.colors.messages.error.bg = base08

# Border color of an error message.
container.colors.messages.error.border = base08

# Foreground color of a warning message.
container.colors.messages.warning.fg = base00

# Background color of a warning message.
container.colors.messages.warning.bg = base0E

# Border color of a warning message.
container.colors.messages.warning.border = base0E

# Foreground color of an info message.
container.colors.messages.info.fg = base05

# Background color of an info message.
container.colors.messages.info.bg = base00

# Border color of an info message.
container.colors.messages.info.border = base00

# Foreground color for prompts.
container.colors.prompts.fg = base05

# Border used around UI elements in prompts.
container.colors.prompts.border = base00

# Background color for prompts.
container.colors.prompts.bg = base00

# Background color for the selected item in filename prompts.
container.colors.prompts.selected.bg = base02

# # Foreground color of the statusbar.
# container.colors.statusbar.normal.fg = base0B
#
# # Background color of the statusbar.
# container.colors.statusbar.normal.bg = base00
#
# # Foreground color of the statusbar in insert mode.
# container.colors.statusbar.insert.fg = base00
#
# # Background color of the statusbar in insert mode.
# container.colors.statusbar.insert.bg = base0D
#
# # Foreground color of the statusbar in passthrough mode.
# container.colors.statusbar.passthrough.fg = base00
#
# # Background color of the statusbar in passthrough mode.
# container.colors.statusbar.passthrough.bg = base0C
#
# # Foreground color of the statusbar in private browsing mode.
# container.colors.statusbar.private.fg = base00
#
# # Background color of the statusbar in private browsing mode.
# container.colors.statusbar.private.bg = base01
#
# # Foreground color of the statusbar in command mode.
# container.colors.statusbar.command.fg = base05
#
# # Background color of the statusbar in command mode.
# container.colors.statusbar.command.bg = base00
#
# # Foreground color of the statusbar in private browsing + command mode.
# container.colors.statusbar.command.private.fg = base05
#
# # Background color of the statusbar in private browsing + command mode.
# container.colors.statusbar.command.private.bg = base00
#
# # Foreground color of the statusbar in caret mode.
# container.colors.statusbar.caret.fg = base00
#
# # Background color of the statusbar in caret mode.
# container.colors.statusbar.caret.bg = base0E
#
# # Foreground color of the statusbar in caret mode with a selection.
# container.colors.statusbar.caret.selection.fg = base00
#
# # Background color of the statusbar in caret mode with a selection.
# container.colors.statusbar.caret.selection.bg = base0D
#
# # Background color of the progress bar.
# container.colors.statusbar.progress.bg = base0D
#
# # Default foreground color of the URL in the statusbar.
# container.colors.statusbar.url.fg = base05
#
# # Foreground color of the URL in the statusbar on error.
# container.colors.statusbar.url.error.fg = base08
#
# # Foreground color of the URL in the statusbar for hovered links.
# container.colors.statusbar.url.hover.fg = base05
#
# # Foreground color of the URL in the statusbar on successful load
# # (http).
# container.colors.statusbar.url.success.http.fg = base0C
#
# # Foreground color of the URL in the statusbar on successful load
# # (https).
# container.colors.statusbar.url.success.https.fg = base0B
#
# # Foreground color of the URL in the statusbar when there's a warning.
# container.colors.statusbar.url.warn.fg = base0E

# Background color of the tab bar.
container.colors.tabs.bar.bg = base00

# Color gradient start for the tab indicator.
container.colors.tabs.indicator.start = base0D

# Color gradient end for the tab indicator.
container.colors.tabs.indicator.stop = base0C

# Color for the tab indicator on errors.
container.colors.tabs.indicator.error = base08

# Foreground color of unselected odd tabs.
container.colors.tabs.odd.fg = base05

# Background color of unselected odd tabs.
container.colors.tabs.odd.bg = base01

# Foreground color of unselected even tabs.
container.colors.tabs.even.fg = base05

# Background color of unselected even tabs.
container.colors.tabs.even.bg = base00

# Background color of pinned unselected even tabs.
container.colors.tabs.pinned.even.bg = base0C

# Foreground color of pinned unselected even tabs.
container.colors.tabs.pinned.even.fg = base07

# Background color of pinned unselected odd tabs.
container.colors.tabs.pinned.odd.bg = base0B

# Foreground color of pinned unselected odd tabs.
container.colors.tabs.pinned.odd.fg = base07

# Background color of pinned selected even tabs.
container.colors.tabs.pinned.selected.even.bg = base02

# Foreground color of pinned selected even tabs.
container.colors.tabs.pinned.selected.even.fg = base05

# Background color of pinned selected odd tabs.
container.colors.tabs.pinned.selected.odd.bg = base02

# Foreground color of pinned selected odd tabs.
container.colors.tabs.pinned.selected.odd.fg = base05

# Foreground color of selected odd tabs.
container.colors.tabs.selected.odd.fg = base05

# Background color of selected odd tabs.
container.colors.tabs.selected.odd.bg = base02

# Foreground color of selected even tabs.
container.colors.tabs.selected.even.fg = base05

# Background color of selected even tabs.
container.colors.tabs.selected.even.bg = base02

# Background color for webpages if unset (or empty to use the theme's
# color).
container.colors.webpage.bg = base00
