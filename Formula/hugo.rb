VERSION = "0.20.7".freeze

CHECKSUMS = {
  "Linux-64bit" => "04f2c7d2f6ea500b0ead4821f035f334b7ac370154509653391bfccec1c4d524",
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
