VERSION = "1.6.0".freeze

CHECKSUMS = {
  "linux-amd64" => "889161a6fb593f3d4bf3e34345a819f9b4488a9f774248abe78ceef6f2f9c90e",
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
