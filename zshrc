# Set name of the theme to load --- if set to "random", it will    
# load a random theme each time oh-my-zsh is loaded, in which case,    
# to know which specific one was loaded, run: echo $RANDOM_THEME    
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes    
ZSH_THEME="gnzh"


# ====================
# ===   Exports    ===
# ====================

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# LD Library
# export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
# If you come from bash you might have to change your $PATH.    
# export PATH=$HOME/bin:/usr/local/bin:$PATH    
    
# Path to your oh-my-zsh installation.    
export ZSH="$HOME/.oh-my-zsh"    
       
# Extend Path
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH


# =============================
# ===   General settings    ===
# =============================

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="%m.%d.%y  %T"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# ============================================
# ===   Completion and Highlight styles    ===
# ============================================


source /usr/share/zsh/manjaro-zsh-config
source /usr/share/zsh/manjaro-zsh-prompt


# ZSH_AUTOSUGGEST_STRATEGY=(history completion) 
    
# Enable highlighters    
ZSH_HIGHLIGHT_HIGHLIGHTERS=(brackets cursor line main pattern root)

typeset -A ZSH_HIGHLIGHT_STYLES

# Override highlighter colors    
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'    
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan,underline'    
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=blue' 
#ZSH_HIGHLIGHT_STYLES[globbing]='none'    
#ZSH_HIGHLIGHT_STYLES[default]=none    
#ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009    
#ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout    
#ZSH_HIGHLIGHT_STYLES[builtin]=fg=white,bold    
#ZSH_HIGHLIGHT_STYLES[function]=fg=white,bold    
#ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold    
#ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline    
#ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009    
#ZSH_HIGHLIGHT_STYLES[globbing]=fg=063    
#ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline    
#ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none    
#ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none    
#ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none   
#ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
#ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
#ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
#ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
#ZSH_HIGHLIGHT_STYLES[assign]=none


# ====================
# ===   Plugins    ===
# ====================

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
archlinux
autojump
bgnotify
colored-man-pages
colorize
common-aliases
copydir
copyfile
cp
dircycle
encode64
extract
fzf
gem
git
git-extras
github
gitignore
globalias
history
jump
man
nmap
pip
ripgrep
sudo
ufw
urltools
web-search
z
fancy-ctrl-z
per-directory-history
zsh-autosuggestions
zsh-syntax-highlighting
)

# ======================================
# ===   Execute initializaion        ===
# ===   Needs to be after 'plugins'  ===
# ======================================

[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
# Load completion.
# autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh


# =============================
# ===   Personal Aliases    ===
# =============================

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias top='htop --user=$USER'
alias mc='mc -u'
alias ncdu='ncdu --color dark'
alias nvim="NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim"
alias vim='nvim'
alias mutt='neomutt'
alias mkdir='mkdir -p'
alias cert='openssl s_client -showcerts -connect $1:$2'

alias dir='colorls'
alias ls='colorls'
alias la='colorls -l -a'
alias lh='colorls -l -h'
alias ll='colorls -l'

alias cp='cp -g'
alias mv='mv -g'

alias virtual='python3 -m venv .venv'
alias activate='source .venv/bin/activate'

function search() {
    pacman -Ss $1
}


# =======================================
# ===   Copy / Paste using vi style   ===
# =======================================

yanktoclipboard() {
    echo $BUFFER | xsel -i -b
}

pastefromclipboard() {
    RBUFFER=$(xsel -o -b </dev/null)$RBUFFER
}

zle -N yanktoclipboard
zle -N pastefromclipboard

bindkey -a 'yy' yanktoclipboard
bindkey -a 'p' pastefromclipboard


# =========================
# ===   Fuzzy Finder    ===
# =========================

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh


# =========================
# ===   Virtual text    ===
# =========================

codi() {
   local syntax="${1:-python}"
   shift
   nvim -c \
     "let g:startify_disable_at_vimenter = 1 |\
     set bt=nofile ls=0 noru nonu nornu |\
     hi CodiVirtualText guifg=red
     hi ColorColumn ctermbg=NONE |\
     hi VertSplit ctermbg=NONE |\
     hi NonText ctermfg=0 |\
     Codi $syntax" "$@"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
