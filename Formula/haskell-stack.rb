VERSION = "1.5.1".freeze

CHECKSUMS = {
  linux_amd64: "6a250cbab60870f6b933c780c96c5cafb02d066a6f2d7182bb00ec005262842b",
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
  sha256 CHECKSUMS[platform]

  def install
    bin.install "stack"
  end

  test do
    system "#{bin}/stack", "--version"
  end
end
