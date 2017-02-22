VERSION = "1.8".freeze

CHECKSUMS = {
  "linux-amd64" => "53ab94104ee3923e228a2cb2116e5e462ad3ebaeea06ff04463479d7f12d27ca",
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
