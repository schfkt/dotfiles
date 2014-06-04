# This theme is based on the steef theme from oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/steeef.zsh-theme
pipe_symbol="%F{253%}|%{$reset_color%}"

# ruby version
function ruby_version()
{
  local rvm_color="%F{160}"
  if which rvm-prompt &> /dev/null; then
    echo " %{$pipe_symbol%} %{$rvm_color%}"`rvm-prompt v g`"%{$reset_color%}"
  fi
}

# node version
zmodload zsh/pcre
function node_version()
{
  local nvm_color="%F{70}"
  if which nvm &> /dev/null; then
    if [[ "$(node -v)" -pcre-match "v(\d+\.\d+\.\d+)" ]]; then
      echo " %{$pipe_symbol%} %{$nvm_color%}$match%{$reset_color%}"
    fi
  fi
}

# prompt style and colors based on Steve Losh's Prose theme:
# http://github.com/sjl/oh-my-zsh/blob/master/themes/prose.zsh-theme
#
# vcs_info modifications from Bart Trojanowski's zsh prompt:
# http://www.jukie.net/bart/blog/pimping-out-zsh-prompt
#
# git untracked files modification from Brian Carper:
# http://briancarper.net/blog/570/git-info-in-your-zsh-prompt

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}
PR_GIT_UPDATE=1

setopt prompt_subst
autoload colors
colors

autoload -U add-zsh-hook
autoload -Uz vcs_info

#use extended color pallete if available
if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    turquoise="%F{4}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
else
    turquoise="$fg[cyan]"
    orange="$fg[yellow]"
    purple="$fg[magenta]"
    hotpink="$fg[red]"
    limegreen="$fg[green]"
fi

# enable VCS systems you use
zstyle ':vcs_info:*' enable git svn

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true

# set formats
# %b - branchname
# %u - unstagedstr (see below)
# %c - stagedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository
branch_color="%F{4}"
staged_color="%F{70}"
unstaged_color="%F{166}"
new_files_color="%F{164}"
PR_RST="%{${reset_color}%}"
FMT_BRANCH="%{$pipe_symbol%} %{$branch_color%}%b%u%c${PR_RST}"
FMT_ACTION=" %F{91%}%a${PR_RST}"
FMT_UNSTAGED="%{$unstaged_color%}+"
FMT_STAGED="%{$staged_color%}+"

zstyle ':vcs_info:*:prompt:*' unstagedstr   "${FMT_UNSTAGED}"
zstyle ':vcs_info:*:prompt:*' stagedstr     "${FMT_STAGED}"
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}"
zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""


function steeef_preexec {
    case "$(history $HISTCMD)" in
        *git*)
            PR_GIT_UPDATE=1
            ;;
        *svn*)
            PR_GIT_UPDATE=1
            ;;
    esac
}
add-zsh-hook preexec steeef_preexec

function steeef_chpwd {
    PR_GIT_UPDATE=1
}
add-zsh-hook chpwd steeef_chpwd

function steeef_precmd {
    if [[ -n "$PR_GIT_UPDATE" ]] ; then
        # check for untracked files or updated submodules, since vcs_info doesn't
        if git ls-files --other --exclude-standard --directory 2> /dev/null | grep -q "."; then
            PR_GIT_UPDATE=1
            FMT_BRANCH="%{$pipe_symbol%} %{$branch_color%}%b%u%c%{$new_files_color%}+${PR_RST}"
        else
            FMT_BRANCH="%{$pipe_symbol%} %{$branch_color%}%b%u%c${PR_RST}"
        fi
        zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"

        vcs_info 'prompt'
        PR_GIT_UPDATE=
    fi
}
add-zsh-hook precmd steeef_precmd

# ahead commits
function num_ahead() {
  local ahead_color="%F{28}"
  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    echo " %{$ahead_color%}$NUM_AHEAD -->%{$reset_color%}"
  fi
}

# behind commits
function num_behind() {
  local behind_color="%F{160}"
  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    echo " %{$behind_color%}<-- $NUM_BEHIND%{$reset_color%}"
  fi
}

pwd_color="%F{6}"
symbol_color="%F{160}"

PROMPT=$'
%{$pwd_color%}%~%{$reset_color%} $vcs_info_msg_0_$(num_ahead)$(num_behind)$(ruby_version)$(node_version)
%{$symbol_color%}>%{$reset_color%} '
