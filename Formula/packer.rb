VERSION = "0.12.0".freeze

CHECKSUMS = {
  linux_amd64: "ce6362d527ba697e40b8c90a98d2034b7749e2357fa238b08536aed44f037073",
}.freeze

class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://www.packer.io/"

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

  url "https://releases.hashicorp.com/packer/#{VERSION}/packer_#{VERSION}_#{platform}.zip"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer", "version"
  end
end
