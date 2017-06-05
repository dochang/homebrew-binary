VERSION = "1.8.3".freeze

CHECKSUMS = {
  "linux-amd64" => "1862f4c3d3907e59b04a757cfda0ea7aa9ef39274af99a784f5be843c80c6772",
}.freeze

class Go < Formula
  desc "The Go programming language"
  homepage "https://golang.org"

  class << self
    def platform
      case
      when OS.linux?
        case
        when Hardware::CPU.intel?
          if Hardware::CPU.is_64_bit?
            return "linux-amd64"
          end
        end
      end
      raise "Platform not supported."
    end
  end

  url "https://storage.googleapis.com/golang/go#{VERSION}.#{platform}.tar.gz"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/go", "version"
  end
end
