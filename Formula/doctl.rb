class Doctl < Formula
  desc "Command-line tool for DigitalOcean"
  homepage "https://github.com/digitalocean/doctl"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/digitalocean/doctl/releases/download/v1.7.1/doctl-1.7.1-linux-amd64.tar.gz"
        version "1.7.1"
        sha256 "48ce63e156f65922f73678011279cf6d13e0971a76fcc87a3a7ff17eed33db78"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "doctl"
  end

  test do
    system "#{bin}/doctl", "version"
  end
end
