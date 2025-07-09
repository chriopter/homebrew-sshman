# sshman

sshman provides a nice TUI to register and manage a cloud-synced ssh config & all your identities. Use it to keep SSH-Keys and config in sync across multiple Macs.

- ☁️ **Cloud sync** - Config, Authorized Keys and Identities in Syncing Folder of your choice
- 🔑 **Keychain integration** - Register Identities in iCloud Keychain your passphrase 
- 🔐 **Forces encryption** - No accidental unencrypted keys
- 🖥️ **Server management** - Link SSH keys to specific servers with custom aliases

## Quick Start

Install:
```bash
brew tap chriopter/sshman
brew install sshman
```

## Menu Options

Run `sshman` to see:

1. **Install/Update** - Set up or change sync folder
2. **List Identities** - See all keys with 🔐/🔓 status
3. **Generate New** - Create encrypted SSH keys
4. **Add to Keychain** - Store passphrases in iCloud Keychain
5. **Link to Server** - Configure host shortcuts
6. **Exit**

## How It Works

Folder structure that is created:
```
~/Documents/SSH/          # Or wherever you choose
├── config               # Host configurations  
├── known_hosts          # Verified servers
└── Identities/          # Your SSH keys
    ├── id_ed25519_github
    └── id_ed25519_work
```


## Examples

Your `~/.ssh/config` includes the synced config automatically.


Set up:
```bash
sshman
# Select 1 to configure cloud sync
```

Generate secure keys:
```bash
sshman
# Select 3: Generate New Identity
```

Add to Keychain:
```bash
sshman
# Select 4: Add to Keychain
```

Register a server:
```bash
sshman
# Select 5: Link Identity to Server
```

That's it! Your SSH keys now sync across all your Macs automatically. Re-Run Setup on other computers.


## Security

- ✅ All keys must have passphrases
- ✅ Unencrypted keys are rejected
- ✅ SSH config backups before changes
- ✅ Keys stored with 600 permissions

## Troubleshooting

**Can't find sync folder?**
- Check iCloud Drive is accessible by Terminal

**Key not working?**
- Run `sshman` → 2 to check encryption status
- Ensure key is added to keychain (option 4)

**Need help?**
- Open an issue: [github.com/christophereller/homebrew-sshman/issues](https://github.com/christophereller/homebrew-sshman/issues)

## Development

To release: Update VERSION in `sshman` script, commit, and push. CI will auto-update the formula.

Tests run automatically on every push.
```

## Caution

LLM Code, use with Caution.