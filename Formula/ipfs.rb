VERSION = "0.4.5".freeze

CHECKSUMS = {
  "linux-amd64" => "2d3b937596eeea98230adf9f60b2f55fdb8701a0ad50936185fe8855ba96fd46",
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
