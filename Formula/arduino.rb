VERSION = "1.8.4".freeze

CHECKSUMS = {
  linux64: "3f6434deadaef085dd2545b1ccaaa134d9c57d7df94cdba051cb5d7e53ef0fc6",
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
