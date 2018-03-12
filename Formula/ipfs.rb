class Ipfs < Formula
  desc "Peer-to-peer hypermedia protocol"
  homepage "https://ipfs.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://dist.ipfs.io/go-ipfs/v0.4.13/go-ipfs_v0.4.13_linux-amd64.tar.gz"
        version "0.4.13"
        sha256 "aac410ae49cec7fb6788044a7d01a1e3f377f77650e6c191357831ce6cd06283"
      when :arm
        url "https://dist.ipfs.io/go-ipfs/v0.4.13/go-ipfs_v0.4.13_linux-arm.tar.gz"
        version "0.4.13"
        sha256 "4ff4c636dac2a332ea1c1cce9ee3a86866b8fb3f0e501966f7b809783a13032f"
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
