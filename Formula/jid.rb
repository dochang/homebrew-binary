VERSION = "0.6.2".freeze

CHECKSUMS = {
  linux_amd64: "17bf8657edd74e570286018d86a4a8835ced0e9ea1ea79b5284f9caa9355275f",
}.freeze

class Jid < Formula
  desc "json incremental digger"
  homepage "https://github.com/simeji/jid"

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

  url "https://github.com/simeji/jid/releases/download/#{VERSION}/jid_#{platform}.zip"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "jid_#{self.class.platform}" => "jid"
  end

  test do
    system "false"
  end
end
