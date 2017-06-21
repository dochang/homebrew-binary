VERSION = "0.24".freeze

CHECKSUMS = {
  "Linux-64bit" => "2c916beb2f7ca286e843eba1a0e5686111381ee6a5b0e032ab965f22ba99cb2b",
}.freeze

class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"

  class << self
    def platform
      case
      when OS.linux?
        case
        when Hardware::CPU.intel?
          if Hardware::CPU.is_64_bit?
            return "Linux-64bit"
          end
        end
      end
      raise "Platform not supported."
    end
  end

  url "https://github.com/spf13/hugo/releases/download/v#{VERSION}/hugo_#{VERSION}_#{platform}.tar.gz"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "hugo"
  end

  test do
    system "#{bin}/hugo", "version"
  end
end
