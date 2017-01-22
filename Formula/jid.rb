VERSION = "0.7.2".freeze

CHECKSUMS = {
  linux_amd64: "57d9e6cb6dcd052d7ffcfddd7bc88fd5a07351a9bdf0575d3355a9921153e177",
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
