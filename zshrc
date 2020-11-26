# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk


# ====================
# ===   Configs    ===
# ====================

# Theme
zinit ice depth=1; zinit light romkatv/powerlevel10k


# ====================
# ===   Plugins    ===
# ====================

zinit ice lucid nocompile wait'0e' nocompletions
zinit load MenkeTechnologies/zsh-more-completions

setopt correct
setopt correct_all
setopt extendedglob

autoload -Uz compinit
compinit -c

zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-you-should-use
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit light softmoth/zsh-vim-mode
zinit light jimhester/per-directory-history

zinit snippet OMZL::directories.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::theme-and-appearance.zsh

zinit snippet OMZP::archlinux
zinit snippet OMZP::autojump
zinit snippet OMZP::bgnotify
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::colorize
zinit snippet OMZP::common-aliases
zinit snippet OMZP::extract
zinit snippet OMZP::fancy-ctrl-z
zinit snippet OMZP::fzf
zinit snippet OMZP::git
zinit snippet OMZP::git-extras
zinit snippet OMZP::history
zinit snippet OMZP::man
zinit snippet OMZP::nmap
zinit snippet OMZP::pip
zinit snippet OMZP::sudo
zinit snippet OMZP::urltools

zinit light wfxr/forgit
zinit light hlissner/zsh-autopair

# ====================
# ===   Exports    ===
# ====================


# You may need to manually set your language environment
export LANG=en_US.UTF-8
# Compilation flags
export ARCHFLAGS="-arch x86_64"
# Extend Path
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH


# ============================================
# ===   Completion and Highlight styles    ===
# ============================================

autoload -U colors && colors
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    
# Enable highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(brackets cursor line main pattern root)

typeset -A ZSH_HIGHLIGHT_STYLES

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


# =========================
# ===   Fuzzy Finder    ===
# =========================


source $HOME/.snippets.fzf

# ======================================
# ===   Execute initializaion        ===
# ===   Needs to be after 'plugins'  ===
# ======================================

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:*' continuous-trigger '/'
zstyle ':completion:*:descriptions' format
zstyle ':fzf-tab:*' show-group full

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Initialize completion
source ~/.local/bin/manydots-magic
autoload -Uz manydots-magic
manydots-magic


# =============================
# ===   Personal Aliases    ===
# =============================

alias top='htop --user=$USER'
alias free='free -m'
alias mc='mc -u'
alias ncdu='ncdu --color dark'
alias nvim="NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim"
alias vim='nvim'
alias mkdir='mkdir -p'
alias cert='openssl s_client -showcerts -connect $1:$2'

alias dir='colorls'
alias ls='colorls'
alias la='colorls -l -a'
alias lh='colorls -l -h'
alias ll='colorls -l'

alias cp='cp -g'
alias mv='mv -g'

alias cat='bat'

alias virtual='python3 -m venv .venv'
alias activate='source .venv/bin/activate'


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

enable-fzf-tab
