VERSION = "0.6.0".freeze

CHECKSUMS = {
  "x86_64-unknown-linux-musl" => "477b22380c826be5fa349ffe6c3f0ff0cab78200049cd2bacea4511a331e2457",
}.freeze

class Ripgrep < Formula
  desc "ripgrep combines the usability of The Silver Searcher with the raw speed of grep."
  homepage "https://github.com/BurntSushi/ripgrep"

  class << self
    def platform
      case
      when OS.linux?
        case
        when Hardware::CPU.intel?
          if Hardware::CPU.is_64_bit?
            return "x86_64-unknown-linux-musl"
          end
        end
      end
      raise "Platform not supported."
    end
  end

  url "https://github.com/BurntSushi/ripgrep/releases/download/#{VERSION}/ripgrep-#{VERSION}-#{platform}.tar.gz"
  sha256 CHECKSUMS[platform]

  def install
    bin.install "rg"
    man1.install "rg.1"

    bash_completion.install "complete/rg.bash-completion"
    fish_completion.install "complete/rg.fish"
    zsh_completion.install "complete/_rg"
  end

  test do
    system "#{bin}/rg", "--version"
  end
end
