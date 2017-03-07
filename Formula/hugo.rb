VERSION = "0.19".freeze

CHECKSUMS = {
  linux_amd64: "f5edfa4275a5011ea92e1a79dc9023f5d801f8ad52fcf05afabd1ce644dcf954",
}.freeze

URL_PLATFORM = {
  linux_amd64: "Linux-64bit",
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
            return :linux_amd64
          end
        end
      end
      raise "Platform not supported."
    end

    def extname
      OS.linux? ? "tar.gz" : "zip"
    end
  end

  url "https://github.com/spf13/hugo/releases/download/v#{VERSION}/hugo_#{VERSION}_#{URL_PLATFORM[platform]}.#{extname}"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "hugo_#{self.class.version}_#{self.class.platform}" => "hugo"
  end

  test do
    system "#{bin}/hugo", "version"
  end
end
