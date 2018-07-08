class Doctl < Formula
  desc "Command-line tool for DigitalOcean"
  homepage "https://github.com/digitalocean/doctl"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/digitalocean/doctl/releases/download/v1.8.3/doctl-1.8.3-linux-amd64.tar.gz"
        version "1.8.3"
        sha256 "e9eea4b2343ae8e43adc5a9c878ec4b51cfecb389059b8e385ab5bc1f5036851"
      when :arm
        url "file://#{__FILE__}"
        version "1.8.3"
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
