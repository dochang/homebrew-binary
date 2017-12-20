class HaskellStack < Formula
  desc "The Haskell Tool Stack"
  homepage "https://haskellstack.org/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/commercialhaskell/stack/releases/download/v1.6.1/stack-1.6.1-linux-x86_64-static.tar.gz"
        sha256 "5f7ad6f2934561beb296d472f77034033c38a89a2ec2aeba78edcbb0034af80e"
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
