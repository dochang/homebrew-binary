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
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-2018.4.8-linux-amd64.tgz"
        version "2018.4.8"
        sha256 "3ee4ad2ba696d33d9c85a0c00923e8636a4c70b0fa1cf8877d99c11ec1dd5d98"
      when :arm
        url "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-2018.4.8-linux-arm.tgz"
        version "2018.4.8"
        sha256 "9b7db92db9b22888c990971d988b6f4b032eb9fa9095befd140402a7c5823d3f"
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
