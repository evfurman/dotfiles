##### iTerm2 Settings #####
#
### iTerm2 Shell Integration ### {{{
#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

### iTerm2 Shell Integration ### }}}

##### ZSH Settings #####
#
### Oh My Zsh! ### {{{
#
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git pass taskwarrior safe-paste terraform zsh-autosuggestions fast-syntax-highlighting colored-man-pages zsh-apple-touchbar zsh-history-substring-search kubectl)

source $ZSH/oh-my-zsh.sh
# export DISABLE_AUTO_TITLE="true"
# precmd_functions=(spaceship_exec_time_precmd_hook)
# preexec_functions=(spaceship_exec_time_preexec_hook)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### End Oh My Zsh! ### }}}

### Aliases ### {{{
#

# for legacy scripts
alias pip=pip3

### End Aliases ### }}}

##### Environment Variables ##### {{{
# safe tmpdir
export TMPDIR=/${HOME}/tmp/
export TMP=${TMPDIR}

# use UTF-8 locales.
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# LS_COLORS - handy table
#   FG Color     BG  Color     Other FG Color     Other BG Colors
#   30  Black    40  BlackBG   90   Dark Grey     100  Dark GreyBG
#   31  Red      41  RedBG     91   Light Red     101  Light RedBG
#   32  Green    42  GreenBG   92   Light Green   102  Light GreenBG
#   33  Orange   43  OrangeBG  93   Yellow        103  YellowBG
#   34  Blue     44  BlueBG    94   Light Blue    104  Light BlueBG
#   35  Purple   45  PurpleBG  95   Light Purple  105  Light PurpleBG
#   36  Cyan     46  CyanBG    96   Turquoise
#   37  Grey     47  GreyBG    97   White
#
export LS_COLORS="di=94;40:ln=36;40;4:so=35;40:pi=1;35;40:ex=1;32;40:bd=1;33;41:cd=1;33;40:su=37;41:sg=0;41:or=93;4:or=31;1:tw=32;44:ow=0;44"
#              dir┘        │          │        │          │          │          │          │        │       │        │       │       │
#                   symlink┘          │        │          │          │          │          │        │       │        │       │       │
#                               socket┘        │          │          │          │          │        │       │        │       │       │
#                               named pipe/FIFO┘          │          │          │          │        │       │        │       │       │
#                                               executable┘          │          │          │        │       │        │       │       │
#                                                        block device┘          │          │        │       │        │       │       │
#                                                               character device┘          │        │       │        │       │       │
#                                                                               setuid file┘        │       │        │       │       │
#                                                                                        setgid file┘       │        │       │       │
#                                                                                             broken symlink┘        │       │       │
#                                                                                              missing symlink target┘       │       │
#                                                                                          dir other writeable, no sticky bit┘       │
#                                                                                                  dir other writeable, no sticky bit┘

# ZSH uses the "ma" LS_COLOR to color the menu highlight. combine with LS_COLORS and use with zstyle down below
ZSH_MENU_COLORS="${LS_COLORS}:ma=30;43"

# set highlight color for GREP
export GREP_COLOR='1;30;43'

# ZSH history settings
HISTFILE=$HOME/.zhistory       # enable history saving on shell exit
setopt APPEND_HISTORY          # append rather than overwrite history file.
setopt HIST_EXPIRE_DUPS_FIRST  # allow dups, but expire old ones when I hit HISTSIZE
setopt EXTENDED_HISTORY        # save timestamp and runtime information
setopt HIST_IGNORE_DUPS        # ignore duplicate commands
setopt HIST_SAVE_NO_DUPS       # save no duplicated commands in the history file
setopt HIST_REDUCE_BLANKS      # trim unnecessary blanks from history file
setopt HIST_BEEP               # beep when nonexistent history entry
setopt HIST_IGNORE_SPACE       # ignore commands prepended with space
unsetopt INC_APPEND_HISTORY    # append at exit, not ongoing
unsetopt SHARE_HISTORY
HISTSIZE=1000000               # lines of history to maintain memory.  unsetting does not work like bash.
SAVEHIST=1000000               # lines of history to maintain in history file.
# ignore these commands when writing out the history file
HISTORY_IGNORE="(type *|cd|cd *|&|[bf]g|exit|fortune|clear|cl|history|cat *|file *|dict *|which *|rm *|rmdir *|shred *|sudo rm *|sudo cat *|mplayer *|source *|. *|gojo *|mutt|hg st|hg up|hg pull|ifconfig|identify *|kill *|killall *|last|lastlog|ls|make|lpass *|mount)"

# pkgconfig fix
export PKG_CONFIG_PATH=/opt/gnome/lib/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig

# fix PATH
PATH=/usr/local/java/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$HOME/bin

# Preferred text editor.  vim, of course.  Emacs is for heathens.
export EDITOR='vim'

##### End of Environment Variables ##### }}}

### Zsh shell options ### {{{
#
unsetopt MAIL_WARN
setopt AUTO_CD
setopt AUTO_LIST
setopt AUTO_PARAM_SLASH
setopt AUTO_REMOVE_SLASH
setopt COMPLETE_ALIASES

zstyle ':completion:*:default' list-colors ${(s.:.)ZSH_MENU_COLORS}
#
### Zsh shell options ### }}}
