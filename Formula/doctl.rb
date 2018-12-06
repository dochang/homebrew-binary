class Doctl < Formula
  desc "Command-line tool for DigitalOcean"
  homepage "https://github.com/digitalocean/doctl"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/digitalocean/doctl/releases/download/v1.12.0/doctl-1.12.0-linux-amd64.tar.gz"
        version "1.12.0"
        sha256 "fdde25cc59eb306f4b6434e91d2092dc8e6e0a2d28adfb466e65b3b3bd7887d6"
      when :arm
        url "file://#{__FILE__}"
        version "1.12.0"
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
