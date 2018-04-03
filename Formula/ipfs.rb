class Ipfs < Formula
  desc "Peer-to-peer hypermedia protocol"
  homepage "https://ipfs.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://dist.ipfs.io/go-ipfs/v0.4.14/go-ipfs_v0.4.14_linux-amd64.tar.gz"
        version "0.4.14"
        sha256 "ffd8012bd9d64137ecc6cb685a56dff8362a770b4df61e1f6c2abd84e448e7ab"
      when :arm
        url "https://dist.ipfs.io/go-ipfs/v0.4.14/go-ipfs_v0.4.14_linux-arm.tar.gz"
        version "0.4.14"
        sha256 "7dfa1d3cb43a3e889b9e080b05ab8f0ca3766036eb7a9aecf12f951712eea63c"
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
