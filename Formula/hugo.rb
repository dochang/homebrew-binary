VERSION = "0.25.1".freeze

CHECKSUMS = {
  "Linux-64bit" => "fbf8ca850aaaaad331f5b40bbbe8e797115dab296a8486a53c0561f253ca7b00",
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
