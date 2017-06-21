VERSION = "1.7.0".freeze

CHECKSUMS = {
  "linux-amd64" => "a47bc17f2a10c138d84a06f7e793398897c616cdce75b85a4a10349f78be20c2",
}.freeze

class Doctl < Formula
  desc "Command-line tool for DigitalOcean"
  homepage "https://github.com/digitalocean/doctl"

  class << self
    def platform
      case
      when OS.linux?
        case
        when Hardware::CPU.intel?
          if Hardware::CPU.is_64_bit?
            return "linux-amd64"
          end
        end
      end
      raise "Platform not supported."
    end
  end

  url "https://github.com/digitalocean/doctl/releases/download/v#{VERSION}/doctl-#{VERSION}-#{platform}.tar.gz"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "doctl"
  end

  test do
    system "#{bin}/doctl", "version"
  end
end
