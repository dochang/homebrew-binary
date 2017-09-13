class Doctl < Formula
  desc "Command-line tool for DigitalOcean"
  homepage "https://github.com/digitalocean/doctl"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/digitalocean/doctl/releases/download/v1.7.0/doctl-1.7.0-linux-amd64.tar.gz"
        version "1.7.0"
        sha256 "a47bc17f2a10c138d84a06f7e793398897c616cdce75b85a4a10349f78be20c2"
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
