class Cloudflared < Formula
  desc "Cloudflare Argo Tunnel client"
  homepage "https://developers.cloudflare.com/argo-tunnel/"

  # Check [github] page for new versions
  #
  # [github]: https://github.com/cloudflare/cloudflared/commits/master
  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-2018.4.0-linux-amd64.tgz"
        version "2018.4.0"
        sha256 "8dff1594b37fe60e8a0d3db8f4c07197eb83c2497679c1c79a5f42c81cb32d05"
      when :arm
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-2018.4.0-linux-arm.tgz"
        version "2018.4.0"
        sha256 "e810efab4264f05820998a919ef096bca75c8ce2e6d6c25bf07931215e9e410e"
      end
    end
  end

  def install
    bin.install "cloudflared"
  end

  test do
    system bin/"cloudflared", "--version"
  end
end
