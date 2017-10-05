class Arduino < Formula
  desc "Arduino IDE"
  homepage "https://www.arduino.cc/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.arduino.cc/arduino-1.8.5-linux64.tar.xz"
        version "1.8.5"
        sha256 "bdf985da7289c02f8b7761a9a524921f6535fe4cec27a5fc57ce305afc1a1ab9"
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
