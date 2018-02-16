class Rclone < Formula
  desc "rsync for cloud storage"
  homepage "https://rclone.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://downloads.rclone.org/rclone-v1.39-linux-amd64.zip"
        version "1.39"
        sha256 "4bb194b67659312d9e33f043e3eb15144ba01877406ee8092438c19b18c2bbcb"
      when :arm
        url "https://downloads.rclone.org/rclone-v1.39-linux-arm.zip"
        version "1.39"
        sha256 "a8de8991fb359a52dff9e3c7cd822ab9032ede2b62ccb30d37c273a5b41f56ca"
      end
    end
  end

  def install
    bin.install "rclone"
    man1.install "rclone.1"
  end

  test do
    system "#{bin}/rclone", "version"
  end
end
