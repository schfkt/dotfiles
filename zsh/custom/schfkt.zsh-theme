# This theme is based on the steef theme from oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/steeef.zsh-theme
pipe_color="%F{253}"

# ruby version
rvm_color="%F{160}"
function ruby_version()
{
  if which rvm-prompt &> /dev/null; then
    echo " %{$pipe_color%}|%{$reset_color%} %{$rvm_color%}"`rvm-prompt v g`"%{$reset_color%}"
  fi
}

# node version
nvm_color="%F{28}"
function node_version()
{
  if which nvm &> /dev/null; then
    echo " %{$pipe_color%}|%{$reset_color%} %{$nvm_color%}"`nvm version | tail -c +12`"%{$reset_color%}"
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
FMT_BRANCH="%{$pipe_color%}|%{$reset_color%} %{$branch_color%}%b %u%c${PR_RST}"
FMT_ACTION="%{$pipe_color%}|%{$reset_color%} %{$limegreen%}%a${PR_RST}"
FMT_UNSTAGED="%{$unstaged_color%}✚"
FMT_STAGED="%{$staged_color%}✚"

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
            FMT_BRANCH="%{$pipe_color%}|%{$reset_color%} %{$branch_color%}%b %u%c%{$new_files_color%}✚${PR_RST}"
        else
            FMT_BRANCH="%{$pipe_color%}|%{$reset_color%} %{$branch_color%}%b %u%c${PR_RST}"
        fi
        zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"

        vcs_info 'prompt'
        PR_GIT_UPDATE=
    fi
}
add-zsh-hook precmd steeef_precmd

pwd_color="%F{6}"
symbol_color="%F{160}"

PROMPT=$'
%{$pwd_color%}%~%{$reset_color%} $vcs_info_msg_0_$(ruby_version)$(node_version)
%{$symbol_color%}>%{$reset_color%} '
