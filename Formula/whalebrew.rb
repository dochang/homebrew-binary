class Whalebrew < Formula
  desc "Homebrew, but with Docker images"
  homepage "https://github.com/bfirsh/whalebrew"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/bfirsh/whalebrew/releases/download/0.1.0/whalebrew-Linux-x86_64"
        version "0.1.0"
        sha256 "f776cb3bc40fde0cd221e38159d2fa3a7933c4f8cf40a1dad257a09edb0e4af4"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "whalebrew-#{self.class.platform}" => "whalebrew"
  end

  test do
    system "#{bin}/whalebrew", "version"
  end
end
