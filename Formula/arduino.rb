class Arduino < Formula
  desc "Arduino IDE"
  homepage "https://www.arduino.cc/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://downloads.arduino.cc/arduino-1.8.5-linux64.tar.xz"
        version "1.8.5"
        sha256 "bdf985da7289c02f8b7761a9a524921f6535fe4cec27a5fc57ce305afc1a1ab9"
      when :arm
        url "https://downloads.arduino.cc/arduino-1.8.5-linuxarm.tar.xz"
        version "1.8.5"
        sha256 "d0dce15d80e879c90fc86efa81b98afdf2e4db31eaec2f56d57e02a02d47e16b"
      end
    end
  end

  def install
    prefix.install Dir["*"]
  end

  test do
    system "false"
  end
end
