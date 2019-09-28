# Hide the window decoration.  This setting requires a restart on
# Wayland.
# Type: Bool
c.window.hide_decoration = False

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
c.tabs.padding = {'bottom': 1, 'left': 5, 'right': 5, 'top': 1}

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'https://google.com/'

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = 'https://duckduckgo.com/'

c.url.searchengines = { "DEFAULT": "https://duckduckgo.com/?q={}", "g": "https://google.com/?q={}" }

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
c.colors.tabs.selected.odd.fg = '#000000'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#64b130'

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = '#000000'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#64b130'

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs = '10pt fantasque sans mono'

# bind to optimize default hotkey
config.unbind('u')
config.unbind('d')
config.unbind('r')
config.unbind('R')
config.unbind('<Ctrl-v>')
config.unbind('<Ctrl-x>')
config.unbind('<Ctrl-a>')
config.bind('-', 'enter-mode passthrough')
config.bind('rr', 'reload')
config.bind('u', 'scroll-page 0 -0.75')
config.bind('d', 'scroll-page 0 0.75')
config.bind('gu', 'undo')
config.bind('ge', 'tab-close')
config.bind('gp', 'tab-pin')
config.bind('zh', 'zoom-out')
config.bind('zl', 'zoom-in')
config.bind('cs', 'config-source')
config.bind('M', 'hint links spawn mpv {hint-url}')

# bind for quick access web
config.bind('eom', 'spawn html {url}')
config.bind('eim', 'open -t https://longcb.imgur.com/all')
config.bind('esv', 'open -t https://www.youtube.com/watch?v=-e3e9w1GmBw&list=PLh94XVT4dq02frQRRZBHzvj2hwuhzSByN&index=5')
config.bind('egh', 'open -t https://github.com')
config.bind('eyt', 'open -t https://youtube.com')
config.bind('efb', 'open -t https://facebook.com')
config.bind('etw', 'open -t https://twitter.com')
config.bind('esl', 'open -t https://docs.google.com/spreadsheets/d/1HsTu5QJVAqM9NWdZ2Sz8iIx9O7npha7l-WDEXA6XTm4/edit#gid=1005116682')
config.bind('eqa', 'open -t https://docs.google.com/spreadsheets/d/1f3Xw0DKNCiuG4bH0w-zBaRh8O5ArCg9RW_QW3-kNexI/edit#gid=144530364')
config.bind('est', 'open -t qute://settings/')
config.bind('etl', 'open -t https://translate.google.com/')
config.bind('etc', 'open -t https://tracau.vn/')
config.bind('ecb', 'open -t https://dictionary.cambridge.org/')
config.bind('esc', 'open -t https://soundcloud.com/')
config.bind('ecw', 'open -t https://chatwork.com/')
config.bind('ebd', 'open -t http://baobongda.com.vn')
config.bind('eis', 'open -t https://instagram.com')
config.bind('egm', 'open -t https://map.google.com')
config.bind('em0', 'open -t https://mail.google.com/mail/u/0/#inbox')
config.bind('em1', 'open -t https://mail.google.com/mail/u/1/#inbox')
config.bind('em2', 'open -t https://mail.google.com/mail/u/2/#inbox')
config.bind('elh', 'open -t localhost')
config.bind('el3', 'open -t localhost:3000')
config.bind('el8', 'open -t localhost:8000')
config.bind('el9', 'open -t localhost:9000')
config.bind('ed0', 'open -t https://drive.google.com/drive/u/0/my-drive')
config.bind('ed1', 'open -t https://drive.google.com/drive/u/1/my-drive')
config.bind('ed2', 'open -t https://drive.google.com/drive/u/2/my-drive')
config.bind('edtg', 'open -t https://docs.google.com/spreadsheets/d/1ki1KQYN5FTXBgohbJaeluAwxoqoKY6qHX30nePfUtak/edit#gid=0')
config.bind('e14', 'open -t http://kenh14.vn')
config.bind('egk', 'open -t http://genk.vn')
config.bind('ett', 'open -t https://tuoitrenews.vn')
config.bind('eaa', 'open -t https://signin.aws.amazon.com/oauth?redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fconsole%2Fhome%3Fstate%3DhashArgs%2523%26isauthcode%3Dtrue&client_id=arn%3Aaws%3Aiam%3A%3A015428540659%3Auser%2Fhomepage&response_type=code&iam_user=true&account=356889831318')
config.bind('ear', 'open -t https://signin.aws.amazon.com/signin?redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fconsole%2Fhome%3Fstate%3DhashArgs%2523%26isauthcode%3Dtrue&client_id=arn%3Aaws%3Aiam%3A%3A015428540659%3Auser%2Fhomepage&forceMobileApp=0')
config.bind('eac', 'open -t https://console.aws.amazon.com')
config.bind('ewsm', 'open -t https://wsm.sun-asterisk.vn/en/dashboard/user_timesheets')
config.bind('ezl', 'open -t https://chat.zalo.me/')

config.bind('Egh', 'open https://github.com')
config.bind('Eyt', 'open https://youtube.com')
config.bind('Esl', 'open https://docs.google.com/spreadsheets/d/1HsTu5QJVAqM9NWdZ2Sz8iIx9O7npha7l-WDEXA6XTm4/edit#gid=1005116682')
config.bind('Eqa', 'open https://docs.google.com/spreadsheets/d/1f3Xw0DKNCiuG4bH0w-zBaRh8O5ArCg9RW_QW3-kNexI/edit#gid=144530364')
config.bind('Est', 'open qute://settings/')
config.bind('Etl', 'open https://translate.google.com/')
config.bind('Etc', 'open https://tracau.vn/')
config.bind('Ecb', 'open https://dictionary.cambridge.org/')
config.bind('Esc', 'open https://soundcloud.com/')
config.bind('Ecw', 'open https://chatwork.com/')
config.bind('Ebd', 'open http://baobongda.com.vn')
config.bind('Eis', 'open https://instagram.com')
config.bind('Egm', 'open https://map.google.com')
config.bind('Em0', 'open https://mail.google.com/mail/u/0/#inbox')
config.bind('Em1', 'open https://mail.google.com/mail/u/1/#inbox')
config.bind('Em2', 'open https://mail.google.com/mail/u/2/#inbox')
config.bind('Elh', 'open localhost')
config.bind('El3', 'open localhost:3000')
config.bind('El8', 'open localhost:8000')
config.bind('El9', 'open localhost:9000')
config.bind('Ed0', 'open https://drive.google.com/drive/u/0/my-drive')
config.bind('Ed1', 'open https://drive.google.com/drive/u/1/my-drive')
config.bind('Ed2', 'open https://drive.google.com/drive/u/2/my-drive')
config.bind('Edtg', 'open https://docs.google.com/spreadsheets/d/1ki1KQYN5FTXBgohbJaeluAwxoqoKY6qHX30nePfUtak/edit#gid=0')
config.bind('E14', 'open http://kenh14.vn')
config.bind('Egk', 'open http://genk.vn')
config.bind('Ett', 'open https://tuoitrenews.vn')
config.bind('Eaa', 'open https://signin.aws.amazon.com/oauth?redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fconsole%2Fhome%3Fstate%3DhashArgs%2523%26isauthcode%3Dtrue&client_id=arn%3Aaws%3Aiam%3A%3A015428540659%3Auser%2Fhomepage&response_type=code&iam_user=true&account=356889831318')
config.bind('Ear', 'open https://signin.aws.amazon.com/signin?redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fconsole%2Fhome%3Fstate%3DhashArgs%2523%26isauthcode%3Dtrue&client_id=arn%3Aaws%3Aiam%3A%3A015428540659%3Auser%2Fhomepage&forceMobileApp=0')
config.bind('Ewsm', 'open https://wsm.sun-asterisk.vn/en/dashboard/user_timesheets')
config.bind('Efb', 'open https://facebook.com')
config.bind('Etw', 'open https://twitter.com')
config.bind('Ezl', 'open https://chat.zalo.me/')
