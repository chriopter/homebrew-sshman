# sshman

sshman provides a nice TUI to register and manage a cloud-synced ssh config & all your identities. Use it to keep SSH-Keys and config in sync across multiple Macs.

- ☁️ **Cloud sync** - Config and Identities in Syncing Folder of your choice
- 🔑 **Keychain integration** - Save your passphrase in iCloud Keychain 
- 🔐 **Forces encryption** - No accidental unencrypted keys
- 🖥️ **Server management** - Link SSH keys to specific servers with custom aliases
- 🚀 **Smart iCloud handling** - Automatically ensures iCloud directories are accessible
- 📝 **History tracking** - Logs all operations to `.sshman_history` in sync folder

## Quick Start

Install:
```bash
brew tap chriopter/sshman
brew install sshman
```

## How it Works

Run `sshman` to see:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SSH Key Manager
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1) Install/Update Configuration
2) List Identities
3) Generate New Identity
4) Add to Keychain
5) Link Identity to Server
6) Exit
```

- Install on new Computers to register synced config

Folder structure that is created:
```
~/Documents/SSH/          # Or wherever you choose
├── config               # Host configurations  
└── Identities/          # Your SSH keys
    ├── id_ed25519_github
    └── id_ed25519_work
```

## Menu Options Explained

### 1) Install/Update Configuration
Sets up sshman on your Mac. Creates the sync folder structure and configures your SSH to use the synced configuration. If you already have a sync folder (from another Mac), it will detect and use the existing configuration.

### 2) List Identities
Shows all SSH keys in your sync folder. Displays whether each key is encrypted (🔐) or not (🔓), along with the key fingerprint and comment. Only encrypted keys are recommended for security.

### 3) Generate New Identity
Creates a new SSH key pair with your choice of algorithm (ed25519, RSA, or ECDSA). Forces you to set a passphrase for security. The key is saved directly in your sync folder and immediately available on all your Macs.

### 4) Add to Keychain
Stores your SSH key passphrase in the macOS Keychain. Once added, you won't need to enter the passphrase again on this Mac - macOS will automatically unlock the key when needed. **Note:** SSH passphrases are stored in the local keychain and do NOT sync via iCloud. You'll need to add each key to the keychain on each Mac separately.

### 5) Link Identity to Server
Creates convenient SSH host aliases. Instead of typing full connection details every time, you can create shortcuts. When you link an identity to a server, sshman adds a Host entry to your synced config:

```
Host myserver
    HostName example.com
    User alice
    IdentityFile /path/to/your/key
    IdentitiesOnly yes
```

This means:
- You can connect with just: `ssh myserver` (instead of `ssh alice@example.com`)
- It automatically uses the correct user and SSH key
- `IdentitiesOnly yes` ensures only the specified key is tried
- These host configs sync across all your Macs!

That's it! Your SSH keys and host configurations now sync across all your Macs automatically. Re-Run Setup on other computers.


## Security

- ✅ All keys must have passphrases
- ✅ Unencrypted keys are rejected
- ✅ SSH config backups before changes
- ✅ Keys stored with 600 permissions

## Troubleshooting

**Key not working?**
- Run `sshman` → 2 to check encryption status
- Ensure key is added to keychain (option 4)

**iCloud Drive Access**
- Terminal apps need special handling to access iCloud directories
- We use `mkdir -p` to ensure directories are accessible before reading files
- This happens automatically on startup and when SSH connects (included in local ssh config after set up)

**Need help?**
- Open an issue: [github.com/christophereller/homebrew-sshman/issues](https://github.com/christophereller/homebrew-sshman/issues)

## Development

To release: Update VERSION in `sshman` script, commit, and push. CI will auto-update the formula.

Tests run automatically on every push.

## Caution

LLM Code, use with Caution.