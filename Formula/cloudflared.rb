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
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-2018.4.5-linux-amd64.tgz"
        version "2018.4.5"
        sha256 "10279065c0d5be6c196e1fcfa7de208e42c6790fd806966dea23f5b07e25365c"
      when :arm
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-2018.4.5-linux-arm.tgz"
        version "2018.4.5"
        sha256 "ef5b81eb94b4339b11bb15d66bdd8972b355af18cbc063e7e55bc50586401da0"
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
