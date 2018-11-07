class Rclone < Formula
  desc "rsync for cloud storage"
  homepage "https://rclone.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://downloads.rclone.org/v1.44/rclone-v1.44-linux-amd64.zip"
        version "1.44"
        sha256 "73e166e14fbf3955e4c0dfca976821d76ba6744f14c07e1848a0580924dc211d"
      when :arm
        url "https://downloads.rclone.org/v1.44/rclone-v1.44-linux-arm.zip"
        version "1.44"
        sha256 "271e3a77412356b361d418af1f4f2a60af6f66da5aa5a746cfae8cdf6854b6f6"
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
