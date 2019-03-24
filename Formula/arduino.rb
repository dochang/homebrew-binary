class Arduino < Formula
  desc "Arduino IDE"
  homepage "https://www.arduino.cc/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://downloads.arduino.cc/arduino-1.8.9-linux64.tar.xz"
        version "1.8.9"
        sha256 "ea4ea81a9b9b67d6d9eb8d27c34590749f61c45cbb7da223031a6520938d64d3"
      when :arm
        url "https://downloads.arduino.cc/arduino-1.8.9-linuxarm.tar.xz"
        version "1.8.9"
        sha256 "dfe205d08d5bf4ebb05c968ffbebb168a9e93fe1c35110e9571f99e67822b5f0"
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
