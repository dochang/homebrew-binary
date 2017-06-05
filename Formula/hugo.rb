VERSION = "0.21".freeze

CHECKSUMS = {
  "Linux-64bit" => "52e78876999a25193faf1fa942e2fab5c0b3c096fc42a352d2e8a3ca8736dd3b",
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
