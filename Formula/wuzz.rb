VERSION = "0.3.0".freeze

CHECKSUMS = {
  linux_amd64: "a956844dba446810d0910c8e8b77f2315e3b93a8e82cc45c7bcd273185477e17",
}.freeze

class Wuzz < Formula
  desc "Interactive cli tool for HTTP inspection"
  homepage "https://github.com/asciimoo/wuzz"

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

  url "https://github.com/asciimoo/wuzz/releases/download/v#{VERSION}/wuzz_#{platform}"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "wuzz_#{self.class.platform}" => "wuzz"
  end

  test do
    system "#{bin}/wuzz", "--version"
  end
end
