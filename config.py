import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

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

config.bind('<Ctrl-Shift-y>',
            'hint links spawn --detach mpv --force-window yes {hint-url}')
config.bind(';O', 'hint links fill :open -t -r {hint-url}')
config.bind('.', 'repeat-command')
config.bind(';Y', 'hint links yank-primary')
config.bind(';b', 'hint all tab-bg')
config.bind(';d', 'hint links download')
config.bind(';i', 'hint images')
config.bind(';o', 'hint links fill :open {hint-url}')
config.bind(';y', 'hint links yank')
