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
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-2018.10.5-linux-amd64.tgz"
        version "2018.10.5"
        sha256 "6407392cf9ead58c38369641a1de5e2f1826ed9d3a9fbe19aa0c85234a05a718"
      when :arm
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-2018.10.5-linux-arm.tgz"
        version "2018.10.5"
        sha256 "890f0d20348b73ea542d1d938f85a2ff89337d66ac517b129cc18f2bf4e24d9b"
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
