VERSION = "1.7.4".freeze

CHECKSUMS = {
  "linux-amd64" => "47fda42e46b4c3ec93fa5d4d4cc6a748aa3f9411a2a2b7e08e3a6d80d753ec8b",
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
