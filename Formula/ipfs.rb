VERSION = "0.4.6".freeze

CHECKSUMS = {
  "linux-amd64" => "09c6606bcdd32708e8cdbef7d82e0f0076b32c80e6dfc2cd7c2c06c8fe29ac1e",
}.freeze

class Ipfs < Formula
  desc "Peer-to-peer hypermedia protocol"
  homepage "https://ipfs.io/"

  class << self
    def platform
      case
      when OS.linux?
        case
        when Hardware::CPU.intel?
          if Hardware::CPU.is_64_bit?
            return "linux-amd64"
          end
        end
      end
      raise "Platform not supported."
    end
  end

  url "https://dist.ipfs.io/go-ipfs/v#{VERSION}/go-ipfs_v#{VERSION}_#{platform}.tar.gz"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "ipfs"
  end

  test do
    system "#{bin}/ipfs", "version"
  end
end
