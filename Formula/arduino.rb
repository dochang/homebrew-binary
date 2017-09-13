class Arduino < Formula
  desc "Arduino IDE"
  homepage "https://www.arduino.cc/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.arduino.cc/arduino-1.8.4-linux64.tar.xz"
        version "1.8.4"
        sha256 "3f6434deadaef085dd2545b1ccaaa134d9c57d7df94cdba051cb5d7e53ef0fc6"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    prefix.install Dir["*"]
  end

  test do
    system "false"
  end
end
