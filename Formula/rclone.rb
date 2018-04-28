class Rclone < Formula
  desc "rsync for cloud storage"
  homepage "https://rclone.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://downloads.rclone.org/v1.41/rclone-v1.41-linux-amd64.zip"
        version "1.41"
        sha256 "ae8dee585c013ac0b64dee22cf788d9458f44c536a8edcc45d25f091703c3f2e"
      when :arm
        url "https://downloads.rclone.org/v1.41/rclone-v1.41-linux-arm.zip"
        version "1.41"
        sha256 "91e3a747c64a1f15920cf9a7ea5a59f41d222810eeebaeec186fdefabe96cb20"
      end
    end
  end

  def install
    bin.install "rclone"
    man1.install "rclone.1"
  end

  test do
    system bin/"rclone", "version"
  end
end
