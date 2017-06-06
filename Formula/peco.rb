VERSION = "0.5.1".freeze

CHECKSUMS = {
  linux_amd64: "75b0c2d6ae671e47936d505cd10c38e91ad3a2a7a2150b5f2d8ff3522c441a31",
}.freeze

class Peco < Formula
  desc "Simplistic interactive filtering tool"
  homepage "https://github.com/peco/peco"

  class << self
    def platform
      case
      when OS.linux?
        case
        when Hardware::CPU.intel?
          if Hardware::CPU.is_64_bit?
            return :linux_amd64
          end
        end
      end
      raise "Platform not supported."
    end
  end

  url "https://github.com/peco/peco/releases/download/v#{VERSION}/peco_#{platform}.tar.gz"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "peco"
  end

  test do
    system "#{bin}/peco", "--version"
  end
end
