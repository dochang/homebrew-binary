VERSION = "0.0.4".freeze

CHECKSUMS = {
  "Linux-x86_64" => "6c341fcf092325398f6f40bc2db77a67743fb2ea6a86fe5ea9e70dac9ed8ae7a",
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
