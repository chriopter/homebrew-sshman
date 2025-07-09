class Sshman < Formula
  desc "SSH Key Manager for macOS - Sync & Manage SSH Identities"
  homepage "https://github.com/christophereller/homebrew-sshman"
  url "https://github.com/chriopter/homebrew-sshman/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "eb95e7982daee6dfa9e35395adf6a5b5f83a62fc8f5523d6304803482591a7a4"
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