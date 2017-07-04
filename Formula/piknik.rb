VERSION = "0.9.1".freeze

CHECKSUMS = {
  linux_x86_64: "6343075652835a0508bbc3e6404529d5abdb6c835508a91cfaeddfb759e86f73",
}.freeze

class Piknik < Formula
  desc "Copy/paste anything over the network"
  homepage "https://github.com/jedisct1/piknik"

  class << self
    def platform
      case
      when OS.linux?
        case
        when Hardware::CPU.intel?
          if Hardware::CPU.is_64_bit?
            return :linux_x86_64
          end
        end
      end
      raise "Platform not supported."
    end
  end

  url "https://github.com/jedisct1/piknik/releases/download/#{VERSION}/piknik-#{platform}-#{VERSION}.tar.gz"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "piknik"
  end

  test do
    system "#{bin}/piknik", "-version"
  end
end
