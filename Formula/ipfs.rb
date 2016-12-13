VERSION = "0.4.4".freeze

CHECKSUMS = {
  "linux-amd64" => "32ea77ba170b86cafc62f9ad48f551a2a6db2f5792b678d048aeea50205e7a25",
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
