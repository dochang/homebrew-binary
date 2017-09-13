VERSION = "0.9.0".freeze

CHECKSUMS = {
  linux_amd64: "980a048d2414e042190d45d84e620295629e267deb16cdf3df2b48f0cb0c4db3",
}.freeze

class Sift < Formula
  desc "A fast and powerful alternative to grep"
  homepage "https://sift-tool.org/"

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
  end

  url "https://sift-tool.org/downloads/sift/sift_#{VERSION}_#{platform}.tar.gz"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "sift"
  end

  test do
    system "#{bin}/sift", "--version"
  end
end
