class Doctl < Formula
  desc "Command-line tool for DigitalOcean"
  homepage "https://github.com/digitalocean/doctl"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/digitalocean/doctl/releases/download/v1.7.1/doctl-1.7.1-linux-amd64.tar.gz"
        version "1.7.1"
        sha256 "48ce63e156f65922f73678011279cf6d13e0971a76fcc87a3a7ff17eed33db78"
      when :arm
        url "file://#{__FILE__}"
        version "1.7.1"
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
