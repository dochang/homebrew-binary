class Ipfs < Formula
  desc "Peer-to-peer hypermedia protocol"
  homepage "https://ipfs.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://dist.ipfs.io/go-ipfs/v0.4.10/go-ipfs_v0.4.10_linux-amd64.tar.gz"
        version "0.4.10"
        sha256 "c9d4ee36c3d8ea84c56243e63ee4873f43b0fca77d5afa5053ef2c21f286e9cb"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "ipfs"
  end

  test do
    system "#{bin}/ipfs", "version"
  end
end
