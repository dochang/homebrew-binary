class Ripgrep < Formula
  desc "ripgrep combines the usability of The Silver Searcher with the raw speed of grep."
  homepage "https://github.com/BurntSushi/ripgrep"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/BurntSushi/ripgrep/releases/download/0.7.1/ripgrep-0.7.1-x86_64-unknown-linux-musl.tar.gz"
        sha256 "ac595c2239b9a30e0e0744578afa6b73e32cdd8ae61d4f1c0ee5d6b55adbadcf"
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
