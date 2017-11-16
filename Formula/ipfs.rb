class Ipfs < Formula
  desc "Peer-to-peer hypermedia protocol"
  homepage "https://ipfs.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://dist.ipfs.io/go-ipfs/v0.4.12/go-ipfs_v0.4.12_linux-amd64.tar.gz"
        version "0.4.12"
        sha256 "da0f78445656379d6704d7d1e52245ce6d21cfdbc21b5238dcfd49beb74a1d0a"
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
