#compdef sshman
# ZSH completion for sshman

_sshman() {
    local -a options
    options=(
        '1:Install/Update Configuration'
        '2:List Identities'
        '3:Generate New Identity'
        '4:Add to Keychain'
        '5:Link Identity to Server'
        '6:Exit'
    )
    
    # If no arguments yet, show the menu options
    if [[ ${#words[@]} -eq 2 ]]; then
        _describe 'sshman options' options
    fi
    
    # For key type selection in generate (option 3)
    if [[ ${words[2]} == "3" ]] && [[ ${#words[@]} -eq 3 ]]; then
        local -a key_types
        key_types=(
            '1:ed25519 (recommended)'
            '2:rsa'
            '3:ecdsa'
        )
        _describe 'key types' key_types
    fi
}

_sshman "$@"