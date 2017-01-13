VERSION = "1.8.1".freeze

CHECKSUMS = {
  linux64: "95d566ec3cedec90f08677134ea6df6ab48a55ff87e7c3339dcd71e931d75ebd",
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
