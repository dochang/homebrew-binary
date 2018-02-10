class HaskellStack < Formula
  desc "The Haskell Tool Stack"
  homepage "https://haskellstack.org/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/commercialhaskell/stack/releases/download/v1.6.3/stack-1.6.3-linux-x86_64-static.tar.gz"
        sha256 "c16b6b1fc31edb203dac9cd3745872c25ea088f12ca19dffb368de73e8b2b89b"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "stack"
  end

  test do
    system "#{bin}/stack", "--version"
  end
end
