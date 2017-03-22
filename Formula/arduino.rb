VERSION = "1.8.2".freeze

CHECKSUMS = {
  linux64: "f1d4b6a70473930ab33f5b7d416c1b56148ef2ea5fbb78d1ede9feb84c941b88",
}.freeze

class Arduino < Formula
  desc "Arduino IDE"
  homepage "https://www.arduino.cc/"

  class << self
    def platform
      case
      when OS.linux?
        case
        when Hardware::CPU.intel?
          if Hardware::CPU.is_64_bit?
            return :linux64
          end
        end
      end
      raise "Platform not supported."
    end

    def extname
      OS.linux? ? "tar.xz" : "zip"
    end
  end

  url "https://downloads.arduino.cc/arduino-#{VERSION}-#{platform}.#{extname}"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    prefix.install Dir["*"]
  end

  test do
    system "false"
  end
end
