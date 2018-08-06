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
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-2018.7.3-linux-amd64.tgz"
        version "2018.7.3"
        sha256 "e31fd7787d8cb7db5dea1ee759ca43fa4a2c5bf211fca9b0036d80b47ac596a0"
      when :arm
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-2018.7.3-linux-arm.tgz"
        version "2018.7.3"
        sha256 "27a69d15abb66617d516f30a4c237737176f5bd131b48ca006eeb14edc6743cb"
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
