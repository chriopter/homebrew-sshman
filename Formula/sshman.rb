class Sshman < Formula
  desc "SSH Key Manager for macOS - Sync & Manage SSH Identities"
  homepage "https://github.com/christophereller/homebrew-sshman"
  url "https://github.com/chriopter/homebrew-sshman/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "8dd351d8d8684aef0472bce390b085daced6dae5af8a5599343adec0ab0e82c5"
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