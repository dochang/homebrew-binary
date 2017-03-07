VERSION = "0.0.5".freeze

CHECKSUMS = {
  "Linux-x86_64" => "72ebf15fe0bbc43b727243676bd3842ae024ffa2eab6da327132cd2c05fd5193",
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
