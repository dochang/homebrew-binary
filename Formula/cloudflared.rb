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
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz"
        version "2019.3.1"
        sha256 "3d825d1a1d8b7bffa3a930e770f788aa22eef1521c346e523f559f5adc191444"
      when :arm
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-arm.tgz"
        version "2019.3.1"
        sha256 "cf78f2ad19216ed927da56dd0963d63b43e3691ffbd8acd2a299eb9134c45f01"
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
