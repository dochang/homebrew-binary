class Ripgrep < Formula
  desc "ripgrep combines the usability of The Silver Searcher with the raw speed of grep."
  homepage "https://github.com/BurntSushi/ripgrep"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/BurntSushi/ripgrep/releases/download/0.6.0/ripgrep-0.6.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "477b22380c826be5fa349ffe6c3f0ff0cab78200049cd2bacea4511a331e2457"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

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
