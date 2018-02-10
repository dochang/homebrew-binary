class Rclone < Formula
  desc "rsync for cloud storage"
  homepage "https://rclone.org/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.rclone.org/rclone-v1.39-linux-amd64.zip"
        version "1.39"
        sha256 "4bb194b67659312d9e33f043e3eb15144ba01877406ee8092438c19b18c2bbcb"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "rclone"
    man1.install "rclone.1"
  end

  test do
    system "#{bin}/rclone", "version"
  end
end
