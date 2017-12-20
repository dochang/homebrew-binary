class Peco < Formula
  desc "Simplistic interactive filtering tool"
  homepage "https://github.com/peco/peco"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/peco/peco/releases/download/v0.5.2/peco_linux_amd64.tar.gz"
        version "0.5.2"
        sha256 "3dfb85c44c68cd10584c9813f96bd979ae1118735819eda9588cc4ef8adcb99f"
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
