class Ipfs < Formula
  desc "Peer-to-peer hypermedia protocol"
  homepage "https://ipfs.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://dist.ipfs.io/go-ipfs/v0.4.13/go-ipfs_v0.4.13_linux-amd64.tar.gz"
        version "0.4.13"
        sha256 "aac410ae49cec7fb6788044a7d01a1e3f377f77650e6c191357831ce6cd06283"
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
