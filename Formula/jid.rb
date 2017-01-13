VERSION = "0.7.1".freeze

CHECKSUMS = {
  linux_amd64: "97602a7120462fbaa6cea74f33e2e908a418755d9fcac9d7718565bf6ef52a48",
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
