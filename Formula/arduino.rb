VERSION = "1.8.3".freeze

CHECKSUMS = {
  linux64: "57f4062d3d81fff2140d105a615f90e1f75776d3717df907e5ae3b14eb4a8e43",
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
