class Sshman < Formula
  desc "SSH Key Manager for macOS - Sync & Manage SSH Identities"
  homepage "https://github.com/christophereller/homebrew-sshman"
  url "https://github.com/chriopter/homebrew-sshman/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "830aa0f28ab602791be0413735c60a2dce5ebe7b663d6ee95d18a0a252d33202"
  license "MIT"

  depends_on :macos

  def install
    bin.install "sshman"
    bash_completion.install "sshman-completion.bash"
    zsh_completion.install "sshman-completion.zsh" => "_sshman"
    man1.install "sshman.1"
  end

  test do
    # Test that the script runs without error
    assert_match "SSH Key Manager", shell_output("echo 6 | #{bin}/sshman", 0)
  end
end