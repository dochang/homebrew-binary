VERSION = "0.26".freeze

CHECKSUMS = {
  "Linux-64bit" => "67e4ba5ec2a02c8164b6846e30a17cc765b0165a5b183d5e480149baf54e1a50",
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

  url "https://github.com/gohugoio/hugo/releases/download/v#{VERSION}/hugo_#{VERSION}_#{platform}.tar.gz"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "hugo"
  end

  test do
    system "#{bin}/hugo", "version"
  end
end
