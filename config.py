import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {
    'w': 'session-save',
    'q': 'quit',
    'wq': 'quit --save',
    'q': 'quit',
    'toroff': 'set content.proxy system',
    'toron': 'set content.proxy socks://localhost:9050',
}

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = True

# The backend to use to display websites. qutebrowser supports two
# different web rendering engines / backends, QtWebKit and QtWebEngine.
# QtWebKit was discontinued by the Qt project with Qt 5.6, but picked up
# as a well maintained fork: https://github.com/annulen/webkit/wiki -
# qutebrowser only supports the fork. QtWebEngine is Qt's official
# successor to QtWebKit. It's slightly more resource hungry that
# QtWebKit and has a couple of missing features in qutebrowser, but is
# generally the preferred choice. This setting requires a restart.
# Type: String
# Valid values:
#   - webengine: Use QtWebEngine (based on Chromium)
#   - webkit: Use QtWebKit (based on WebKit, similar to Safari)
c.backend = 'webengine'

# Value to send in the `DNT` header. When this is set to true,
# qutebrowser asks websites to not track your identity. If set to null,
# the DNT header is not sent at all.
# Type: Bool
c.content.headers.do_not_track = True

# Whether host blocking is enabled.
# Type: Bool
c.content.host_blocking.enabled = True

# List of URLs of lists which contain hosts to block.  The file can be
# in one of the following formats:  - An `/etc/hosts`-like file - One
# host per line - A zip-file of any of the above, with either only one
# file, or a file named   `hosts` (with any extension).
# Type: List of Url
c.content.host_blocking.lists = ['https://www.malwaredomainlist.com/hostslist/hosts.txt', 'http://someonewhocares.org/hosts/hosts', 'http://winhelp2002.mvps.org/hosts.zip',
                                 'http://malwaredomains.lehigh.edu/files/justdomains.zip', 'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext']

# Enable pdf.js to view PDF files in the browser. Note that the files
# can still be downloaded by clicking the download button in the pdf.js
# viewer.
# Type: Bool
c.content.pdfjs = True

# Whether support for the HTML 5 web application cache feature is
# enabled. An application cache acts like an HTTP cache in some sense.
# For documents that use the application cache via JavaScript, the
# loader engine will first ask the application cache for the contents,
# before hitting the network.
# Type: Bool
c.content.cache.appcache = True

# The maximum number of pages to hold in the global memory page cache.
# The Page Cache allows for a nicer user experience when navigating
# forth or back to pages in the forward/back history, by pausing and
# resuming up to _n_ pages. For more information about the feature,
# please refer to: http://webkit.org/blog/427/webkit-page-cache-i-the-
# basics/
# Type: Int
c.content.cache.maximum_pages = 0

# Size of the HTTP network cache. Null to use the default value.
# Type: Int
c.content.cache.size = None

# Control which cookies to accept.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain.
#   - never: Don't accept cookies at all.
c.content.cookies.accept = 'no-3rdparty'

# Store cookies. Note this option needs a restart with QtWebEngine on Qt
# < 5.9.
# Type: Bool
c.content.cookies.store = True

# Default encoding to use for websites. The encoding must be a string
# describing an encoding such as _utf-8_, _iso-8859-1_, etc.
# Type: String
c.content.default_encoding = 'iso-8859-1'

# Try to pre-fetch DNS entries to speed up browsing.
# Type: Bool
c.content.dns_prefetch = True

# Allow websites to request geolocations.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.geolocation = 'ask'

# Send the Referer header. The Referer header tells websites from which
# website you were coming from when visting them.
# Type: String
# Valid values:
#   - always: Always send the Referer.
#   - never: Never send the Referer. This is not recommended, as some sites may break.
#   - same-domain: Only send the Referer for the same domain. This will still protect your privacy, but shouldn't break any sites.
c.content.headers.referer = 'same-domain'

# Whether images are automatically loaded in web pages.
# Type: Bool
c.content.images = True

# Show javascript alerts.
# Type: Bool
c.content.javascript.alert = True

# Whether JavaScript can read from or write to the clipboard. With
# QtWebEngine, writing the clipboard as response to a user interaction
# is always allowed.
# Type: Bool
c.content.javascript.can_access_clipboard = False

# Whether JavaScript can close tabs.
# Type: Bool
c.content.javascript.can_close_tabs = False

# Whether JavaScript can open new tabs without user interaction.
# Type: Bool
c.content.javascript.can_open_tabs_automatically = False

# Enables or disables JavaScript.
# Type: Bool
c.content.javascript.enabled = True

# Use the standard JavaScript modal dialog for `alert()` and `confirm()`
# Type: Bool
c.content.javascript.modal_dialog = True

# Show javascript prompts.
# Type: Bool
c.content.javascript.prompt = True

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.notifications = 'ask'

# Validate SSL handshakes.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.ssl_strict = 'ask'

# The directory to save downloads to. If unset, a sensible os-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '~/Downloads'

# Prompt the user for the download location. If set to false,
# `downloads.location.directory` will be used.
# Type: Bool
c.downloads.location.prompt = False

# Where to show the downloaded files.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.downloads.position = 'bottom'

# Number of milliseconds to wait before removing finished downloads. If
# set to -1, downloads are never removed.
# Type: Int
c.downloads.remove_finished = 5000

# Leave insert mode if a non-editable element is clicked.
# Type: Bool
c.input.insert_mode.auto_leave = True

# Automatically enter insert mode if an editable element is focused
# after loading the page.
# Type: Bool
c.input.insert_mode.auto_load = True

# Whether quitting the application requires a confirmation.
# Type: ConfirmQuit
# Valid values:
#   - always: Always show a confirmation.
#   - multiple-tabs: Show a confirmation if multiple tabs are opened.
#   - downloads: Show a confirmation if downloads are running
#   - never: Never show a confirmation.
c.confirm_quit = ['downloads']

# The editor (and arguments) to use for the `open-editor` command. `{}`
# gets replaced by the filename of the file to be edited.
# Type: ShellCommand
c.editor.command = ['alacritty', '-e', 'nvim',  '-f', '{file}']

# Encoding to use for the editor.
# Type: Encoding
c.editor.encoding = 'utf-8'

# The page to open if :open -t/-b/-w is used without URL. Use
# `about:blank` for a blank page.
# Type: FuzzyUrl
# c.url.default_page = 'https://start.duckduckgo.com/'
c.url.default_page = 'https://www.google.com/'

config.bind(',P',
            'hint links spawn --detach mpv --force-window yes {hint-url}')
config.bind(',o', 'hint links fill :open {hint-url}')
config.bind(',O', 'hint links fill :open -t -r {hint-url}')
config.bind(',g', 'hint links spawn git clone {hint-url}')
config.bind(',y', 'hint links yank')
config.bind(',Y', 'hint links yank-primary')
config.bind(',d', 'hint links download')
config.bind(',t', 'hint inputs')
config.bind('.', 'repeat-command')
config.bind('<Backspace>', ':back')
