class Rclone < Formula
  desc "rsync for cloud storage"
  homepage "https://rclone.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://downloads.rclone.org/v1.42/rclone-v1.42-linux-amd64.zip"
        version "1.42"
        sha256 "7a623f60a5995f33cca3ed285210d8701c830f6f34d4dc50d74d75edd6a5bfa6"
      when :arm
        url "https://downloads.rclone.org/v1.42/rclone-v1.42-linux-arm.zip"
        version "1.42"
        sha256 "24e4e253176938af5c29553c23bbdc240d84af912014cbad0e7a447d55c1faf6"
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
