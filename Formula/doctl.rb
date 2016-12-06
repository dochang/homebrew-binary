CHECKSUMS = {
  "linux-amd64" => "a8735639c0b02bed700fb5791604b5fd4a86d43876c904b3df02016d32fba1ff",
}.freeze

class Doctl < Formula
  desc "Command-line tool for DigitalOcean"
  homepage "https://github.com/digitalocean/doctl"
  version "1.5.0"

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

  url "https://github.com/digitalocean/doctl/releases/download/v#{version}/doctl-#{version}-#{platform}.tar.gz"
  sha256 CHECKSUMS[platform]

  def install
    bin.install "doctl"
  end

  test do
    system "#{bin}/doctl", "version"
  end
end
