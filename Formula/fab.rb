# Homebrew Formula for FAB CLI
#
# This formula downloads binaries from fdev-llc/fab GitHub Releases.
# The formula is auto-updated by CI on each release.
#
# SHA256 checksums are automatically updated by the release workflow.

class Fab < Formula
  desc "Flutter Advanced Boilerplate CLI - Create production-ready Flutter projects"
  homepage "https://github.com/fdev-llc/fab"
  version "2.0.0-alpha"
  license :cannot_represent  # Proprietary/closed-source

  on_macos do
    on_intel do
      url "https://github.com/fdev-llc/fab/releases/download/v2.0.0-alpha/fab-macos-x64"
      sha256 "82108ac7d9c4c0216a954287596093bae3f88d41d7330520d8152da9b789508c"
    end

    on_arm do
      url "https://github.com/fdev-llc/fab/releases/download/v2.0.0-alpha/fab-macos-arm64"
      sha256 "bb4d34a7a9068b44e89ec301d98be569d4663d7bf7affc00c1432216a81e35d0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fdev-llc/fab/releases/download/v2.0.0-alpha/fab-linux-x64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "fab-macos-arm64" => "fab"
      else
        bin.install "fab-macos-x64" => "fab"
      end
    elsif OS.linux?
      bin.install "fab-linux-x64" => "fab"
    end
  end

  test do
    assert_match "fab", shell_output("#{bin}/fab --version")
  end
end
