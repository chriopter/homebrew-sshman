#!/usr/bin/env bash
# Bash completion for sshman
# shellcheck disable=SC2207

_sshman() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    # Main menu options
    local options="1 2 3 4 5 6"
    
    # If we're completing the first argument (menu choice)
    if [[ ${COMP_CWORD} -eq 1 ]]; then
        COMPREPLY=( $(compgen -W "${options}" -- "${cur}") )
        return 0
    fi
    
    # Add descriptions for better UX when using completion
    case "$prev" in
        sshman)
            # Show numbered options
            COMPREPLY=( $(compgen -W "${options}" -- "${cur}") )
            ;;
    esac
}

complete -F _sshman sshman