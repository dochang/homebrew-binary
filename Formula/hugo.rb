VERSION = "0.17".freeze

CHECKSUMS = {
  linux_amd64: "f1467e204cc469b9ca6f17c0dc4da4a620643b6d9a50cb7dce2508aaf8fbc1ea",
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