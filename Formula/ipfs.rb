class Ipfs < Formula
  desc "Peer-to-peer hypermedia protocol"
  homepage "https://ipfs.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://dist.ipfs.io/go-ipfs/v0.4.18/go-ipfs_v0.4.18_linux-amd64.tar.gz"
        version "0.4.18"
        sha256 "21e6c44c0fa8edf91a727f1e8257342a4c3a879462e656861b0a179e1f6a03f6"
      when :arm
        url "https://dist.ipfs.io/go-ipfs/v0.4.18/go-ipfs_v0.4.18_linux-arm.tar.gz"
        version "0.4.18"
        sha256 "31c5f1bf00a97fff393841c5467e34f1409c35ba406369875e916f7d7cc4408e"
      end
    end
  end

  def install
    bin.install "ipfs"
  end

  test do
    system bin/"ipfs", "version"
  end
end
