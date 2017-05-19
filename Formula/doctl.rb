VERSION = "1.6.1".freeze

CHECKSUMS = {
  "linux-amd64" => "5b06cfecc2fa6c921f73188e3fd04ca12fd5472f648d9e670764f2b3d598a175",
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
