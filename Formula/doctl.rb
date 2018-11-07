class Doctl < Formula
  desc "Command-line tool for DigitalOcean"
  homepage "https://github.com/digitalocean/doctl"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/digitalocean/doctl/releases/download/v1.11.0/doctl-1.11.0-linux-amd64.tar.gz"
        version "1.11.0"
        sha256 "4d17fdb4c225f08db0087addc5c7dafca5561de3b6620a56b19bf95935e14128"
      when :arm
        url "file://#{__FILE__}"
        version "1.11.0"
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
