VERSION = "1.8.1".freeze

CHECKSUMS = {
  "linux-amd64" => "a579ab19d5237e263254f1eac5352efcf1d70b9dacadb6d6bb12b0911ede8994",
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
