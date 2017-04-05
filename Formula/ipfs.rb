VERSION = "0.4.8".freeze

CHECKSUMS = {
  "linux-amd64" => "1302e87fe2707aeced586b90cf24a960a0ca7acbad64b4cc9400c0ce6e0e7052",
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
