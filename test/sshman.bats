#!/usr/bin/env bats
# Test suite for sshman

setup() {
    # Create temporary test directory
    export TEST_DIR="$(mktemp -d)"
    export HOME="$TEST_DIR/home"
    export SSH_DIR="$HOME/.ssh"
    export SYNC_DIR="$HOME/TestSync/SSH"
    
    # Create test home and SSH directory
    mkdir -p "$SSH_DIR"
    mkdir -p "$SYNC_DIR"
    
    # Path to sshman script
    export SSHMAN="${BATS_TEST_DIRNAME}/../sshman"
}

teardown() {
    # Clean up test directory
    rm -rf "$TEST_DIR"
}

@test "sshman script exists and is executable" {
    [ -f "$SSHMAN" ]
    [ -x "$SSHMAN" ]
}

@test "sshman script has correct shebang" {
    run head -n 1 "$SSHMAN"
    [ "$status" -eq 0 ]
    [[ "$output" =~ "#!/usr/bin/env zsh" ]]
}

@test "sshman script contains version" {
    run grep '^VERSION=' "$SSHMAN"
    [ "$status" -eq 0 ]
    [[ "$output" =~ VERSION=\"[0-9]+\.[0-9]+\.[0-9]+\" ]]
}

@test "sshman script defines required functions" {
    # Check for main functions
    grep -q "install_config()" "$SSHMAN"
    grep -q "list_identities()" "$SSHMAN"
    grep -q "generate_identity()" "$SSHMAN"
    grep -q "add_to_keychain()" "$SSHMAN"
    grep -q "link_to_server()" "$SSHMAN"
    grep -q "show_menu()" "$SSHMAN"
}

@test "sshman script defines color variables" {
    grep -q "RED=" "$SSHMAN"
    grep -q "GREEN=" "$SSHMAN"
    grep -q "BLUE=" "$SSHMAN"
    grep -q "YELLOW=" "$SSHMAN"
}

@test "completion scripts exist" {
    [ -f "${BATS_TEST_DIRNAME}/../sshman-completion.bash" ]
    [ -f "${BATS_TEST_DIRNAME}/../sshman-completion.zsh" ]
}

@test "man page exists" {
    [ -f "${BATS_TEST_DIRNAME}/../sshman.1" ]
}

@test "Formula file exists and contains correct test" {
    local formula="${BATS_TEST_DIRNAME}/../Formula/sshman.rb"
    [ -f "$formula" ]
    grep -q 'assert_match "SSH Key Manager"' "$formula"
}

@test "README exists" {
    [ -f "${BATS_TEST_DIRNAME}/../README.md" ]
}

@test "sshman outputs something when run" {
    # Use timeout to prevent hanging, and just check it produces output
    if command -v timeout >/dev/null 2>&1; then
        run timeout 2 bash -c 'echo "6" | "$SSHMAN" 2>&1 | head -20'
    else
        # On macOS without GNU timeout, use a different approach
        run bash -c 'echo "6" | "$SSHMAN" 2>&1 | head -20'
    fi
    [ "${#output}" -gt 0 ]
    [[ "$output" =~ "SSH Key Manager" ]]
}