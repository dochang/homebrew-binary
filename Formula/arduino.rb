VERSION = "1.8.0".freeze

CHECKSUMS = {
  linux64: "a16f4ca4b21bfc2bf98d7cee278d9c88c81cd7a172707d9a7198bf8aa3dac67c",
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
