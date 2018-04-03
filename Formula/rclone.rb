class Rclone < Formula
  desc "rsync for cloud storage"
  homepage "https://rclone.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://downloads.rclone.org/v1.40/rclone-v1.40-linux-amd64.zip"
        version "1.40"
        sha256 "a11022c2d7bd0b2a641b98011e587c04e21589c6059e9581721c0cbf5d8fe178"
      when :arm
        url "https://downloads.rclone.org/v1.40/rclone-v1.40-linux-arm.zip"
        version "1.40"
        sha256 "edfa9f606428edd0ef55c22e608b7c0ddeb180c8cec48b3aea1388aed22865c4"
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
