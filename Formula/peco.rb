class Peco < Formula
  desc "Simplistic interactive filtering tool"
  homepage "https://github.com/peco/peco"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/peco/peco/releases/download/v0.5.1/peco_linux_amd64.tar.gz"
        version "0.5.1"
        sha256 "75b0c2d6ae671e47936d505cd10c38e91ad3a2a7a2150b5f2d8ff3522c441a31"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "peco"
  end

  test do
    system "#{bin}/peco", "--version"
  end
end
