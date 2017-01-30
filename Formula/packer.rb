VERSION = "0.12.2".freeze

CHECKSUMS = {
  linux_amd64: "035d0ea1fe785ab6b673bc2a79399125d4014f29151e106635fa818bb726bebf",
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
