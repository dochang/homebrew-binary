CHECKSUMS = {
  linux_amd64: "fe3df68d310ee36ec9c5416e71141206f9df25e4d65f0a86f4300cd822cf1ae9",
}.freeze

class Jid < Formula
  desc "json incremental digger"
  homepage "https://github.com/simeji/jid"
  version "0.6.1"

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

  url "https://github.com/simeji/jid/releases/download/#{version}/jid_#{platform}.zip"
  sha256 CHECKSUMS[platform]

  def install
    bin.install "jid_#{self.class.platform}" => "jid"
  end

  test do
    system "false"
  end
end
