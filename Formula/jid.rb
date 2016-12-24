VERSION = "0.6.3".freeze

CHECKSUMS = {
  linux_amd64: "3519711e65c896edfdfbb65a0117af4badc24cb7d02a2584d9d1470e81ab4136",
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
