class Ipfs < Formula
  desc "Peer-to-peer hypermedia protocol"
  homepage "https://ipfs.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://dist.ipfs.io/go-ipfs/v0.4.17/go-ipfs_v0.4.17_linux-amd64.tar.gz"
        version "0.4.17"
        sha256 "1bb1050ebe74f9042ac721eb1b71f92e1b0e78e54c59dadfde13080facb2901c"
      when :arm
        url "https://dist.ipfs.io/go-ipfs/v0.4.17/go-ipfs_v0.4.17_linux-arm.tar.gz"
        version "0.4.17"
        sha256 "893461d001a7e8709c9ec6983e0e3e8df7f710f8b8108db1185ed61f46a9a6de"
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
