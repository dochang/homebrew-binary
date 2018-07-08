class Ipfs < Formula
  desc "Peer-to-peer hypermedia protocol"
  homepage "https://ipfs.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://dist.ipfs.io/go-ipfs/v0.4.15/go-ipfs_v0.4.15_linux-amd64.tar.gz"
        version "0.4.15"
        sha256 "48a81cfc34d3a12c8563dbdfae8681be6e4d23c0664d6a192bc2758c4e4ef377"
      when :arm
        url "https://dist.ipfs.io/go-ipfs/v0.4.15/go-ipfs_v0.4.15_linux-arm.tar.gz"
        version "0.4.15"
        sha256 "daa390ab416335a3687a0332ce9ab67c45221dd3b11c6e26ef6c7a99623fb13a"
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
