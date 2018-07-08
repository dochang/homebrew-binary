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
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-2018.7.0-linux-amd64.tgz"
        version "2018.7.0"
        sha256 "13f34fbfef05104496c913807b21c3c8b09b519537acbaa3a8d70ade5dcf97b2"
      when :arm
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-2018.7.0-linux-arm.tgz"
        version "2018.7.0"
        sha256 "829b42e05df6d0b47b0180b84247a3ab43bdfaf443aa027306382fda053a0592"
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
