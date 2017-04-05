VERSION = "1.4.0".freeze

CHECKSUMS = {
  linux_amd64: "8cc2bb0da1e5f77de7257662c63c82ed289b09a37c72c2fc7a8a81983dbe30ba",
}.freeze

URL_PLATFORM = {
  linux_amd64: "linux-x86_64-static",
}.freeze

class HaskellStack < Formula
  desc "The Haskell Tool Stack"
  homepage "https://haskellstack.org/"

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

  url "https://github.com/commercialhaskell/stack/releases/download/v#{VERSION}/stack-#{VERSION}-#{URL_PLATFORM[platform]}.tar.gz"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "stack"
  end

  test do
    system "#{bin}/stack", "--version"
  end
end
