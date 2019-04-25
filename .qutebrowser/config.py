# Hide the window decoration.  This setting requires a restart on
# Wayland.
# Type: Bool
c.window.hide_decoration = True

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = True

# Padding (in pixels) around text for tabs.
# Type: Padding
c.tabs.padding = {'bottom': 5, 'left': 5, 'right': 5, 'top': 5}

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'https://duckduckgo.com/'

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = 'https://duckduckgo.com/'

c.url.searchengines = { "DEFAULT": "https://duckduckgo.com/?q={}", "gh": "https://github.com/{}" }

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
# Type: List of QtColor, or QtColor
c.colors.completion.fg = '#d5c4a1'

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#333333'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#202020'

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = '#8fee96'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.item.selected.border.top = '#151515'

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = '#151515'

# Foreground color of the matched text in the completion.
# Type: QssColor
c.colors.completion.match.fg = '#d75f5f'

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = '#202020'

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = '#d5c4a1'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#202020'

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = '#d4c5a1'

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = '#202020'

# Default foreground color of the URL in the statusbar.
# Type: QssColor
c.colors.statusbar.url.fg = '#d5c4a1'

# Foreground color of the URL in the statusbar on error.
# Type: QssColor
c.colors.statusbar.url.error.fg = '#d75f5f'

# Foreground color of the URL in the statusbar on successful load
# (http).
# Type: QssColor
c.colors.statusbar.url.success.http.fg = '#84edb9'

# Foreground color of the URL in the statusbar on successful load
# (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = '#8fee96'

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = '#cd950c'

# Background color of the tab bar.
# Type: QtColor
c.colors.tabs.bar.bg = '#202020'

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = '#707070'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#202020'

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = '#707070'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#202020'

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = '#d5c4a1'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#202020'

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = '#d5c4a1'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#202020'

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs = '10pt fantasque sans mono'

# Bindings for normal mode
# config.bind(';M', 'hint --rapid links spawn open -na /Applications/mpv.app {hint-url}')
# config.bind('<Meta+n>', 'open -p')
# config.bind('<Meta+w>', 'close')
# config.bind('M', 'hint links spawn open -na /Applications/mpv.app {hint-url}')
# config.bind('m', 'spawn open -na /Applications/mpv.app {url}')
config.bind('eyt', 'open -t https://youtube.com')
config.bind('egh', 'open -t https://github.com')
config.bind('esl', 'open -t https://docs.google.com/spreadsheets/u/1/d/1VjaXOycDguoesjVfVxx6uUSV_cssOHeDWZJDivTvLik/edit#gid=891834841')
config.bind('est', 'open -t qute://settings/')
config.bind('etl', 'open -t https://translate.google.com/')
config.bind('etc', 'open -t https://tracau.vn/')
config.bind('ecb', 'open -t https://dictionary.cambridge.org/')
config.bind('esc', 'open -t https://soundcloud.com/')
config.bind('ecw', 'open -t https://chatwork.com/')
config.unbind('u')
config.unbind('d')
config.bind('u', 'scroll-page 0 -0.8')
config.bind('d', 'scroll-page 0 0.8')
config.bind('wu', 'undo')
config.bind('wd', 'tab-close')
