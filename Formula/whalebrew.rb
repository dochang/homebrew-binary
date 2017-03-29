VERSION = "0.1.0".freeze

CHECKSUMS = {
  "Linux-x86_64" => "f776cb3bc40fde0cd221e38159d2fa3a7933c4f8cf40a1dad257a09edb0e4af4",
}.freeze

class Whalebrew < Formula
  desc "Homebrew, but with Docker images"
  homepage "https://github.com/bfirsh/whalebrew"

  class << self
    def platform
      case
      when OS.linux?
        case
        when Hardware::CPU.intel?
          if Hardware::CPU.is_64_bit?
            return "Linux-x86_64"
          end
        end
      end
      raise "Platform not supported."
    end
  end

  url "https://github.com/bfirsh/whalebrew/releases/download/#{VERSION}/whalebrew-#{platform}"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "whalebrew-#{self.class.platform}" => "whalebrew"
  end

  test do
    system "#{bin}/whalebrew", "version"
  end
end
