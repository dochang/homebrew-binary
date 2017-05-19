VERSION = "0.4.9".freeze

CHECKSUMS = {
  "linux-amd64" => "ae50c760f58548adc7c6dade4cf549059b6bc73ebc25ff4ea9fece06a15ac0a6",
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
