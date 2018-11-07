class Arduino < Formula
  desc "Arduino IDE"
  homepage "https://www.arduino.cc/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://downloads.arduino.cc/arduino-1.8.7-linux64.tar.xz"
        version "1.8.7"
        sha256 "eda4a5b989a317ab56b3700b1c5751308e62bfb8a29bf6829e4cdaaf15b62115"
      when :arm
        url "https://downloads.arduino.cc/arduino-1.8.7-linuxarm.tar.xz"
        version "1.8.7"
        sha256 "723eb82c2b789e4dd53460c8dafc763516cda1aa2aa734e1bc532031519a555b"
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
