VERSION = "1.7.5".freeze

CHECKSUMS = {
  "linux-amd64" => "2e4dd6c44f0693bef4e7b46cc701513d74c3cc44f2419bf519d7868b12931ac3",
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
