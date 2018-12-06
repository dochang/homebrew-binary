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
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-2018.11.0-linux-amd64.tgz"
        version "2018.11.0"
        sha256 "ba2e1f4f44a412bd627d050e1a50463c64d9eca2d041a510d02e1053f4279023"
      when :arm
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-2018.11.0-linux-arm.tgz"
        version "2018.11.0"
        sha256 "efb90d8f62d91d64b862e4dd01e269634f5c78762859c5494486447a0bdd7c7d"
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
