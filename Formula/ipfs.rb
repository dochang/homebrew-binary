class Ipfs < Formula
  desc "Peer-to-peer hypermedia protocol"
  homepage "https://ipfs.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://dist.ipfs.io/go-ipfs/v0.4.11/go-ipfs_v0.4.11_linux-amd64.tar.gz"
        version "0.4.11"
        sha256 "a638ac436597ba20b1a25b289b8c89cfa31a1fc7399de66a35ba04e45562b482"
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
