class Sshman < Formula
  desc "SSH Key Manager for macOS - Sync & Manage SSH Identities"
  homepage "https://github.com/christophereller/homebrew-sshman"
  url "https://github.com/chriopter/homebrew-sshman/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "c20f992d39302867ce7a9590daf27817e5abcbd26c3520b4a291bd0bf5d04358"
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