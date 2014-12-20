autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git*' formats "%b %a"

precmd() {
    vcs_info
}

setopt prompt_subst
PROMPT=$'
%~ => '

RPROMPT='$vcs_info_msg_0_'
