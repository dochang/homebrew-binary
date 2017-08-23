VERSION = "0.4.0".freeze

CHECKSUMS = {
  linux_amd64: "5a1443e07a5a9b9bb813804290e87fdd27b544f4fe00ef95fe3b64e7b56459ec",
}.freeze

class Wuzz < Formula
  desc "Interactive cli tool for HTTP inspection"
  homepage "https://github.com/asciimoo/wuzz"

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

  url "https://github.com/asciimoo/wuzz/releases/download/v#{VERSION}/wuzz_#{platform}"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "wuzz_#{self.class.platform}" => "wuzz"
  end

  test do
    system "#{bin}/wuzz", "--version"
  end
end
