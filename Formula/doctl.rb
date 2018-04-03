class Doctl < Formula
  desc "Command-line tool for DigitalOcean"
  homepage "https://github.com/digitalocean/doctl"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/digitalocean/doctl/releases/download/v1.7.2/doctl-1.7.2-linux-amd64.tar.gz"
        version "1.7.2"
        sha256 "4cc1ac258e0cb8f7325cbcd4fd9796376e57cd71a3323886ffc018c6f8d4baf1"
      when :arm
        url "file://#{__FILE__}"
        version "1.7.2"
      end
    end
  end

  def install
    odie "Platform not supported." if active_spec.url == "file://#{__FILE__}"

    bin.install "doctl"
  end

  test do
    system bin/"doctl", "version"
  end
end
