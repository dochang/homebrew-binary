class Rclone < Formula
  desc "rsync for cloud storage"
  homepage "https://rclone.org/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.rclone.org/rclone-v1.37-linux-amd64.zip"
        version "1.37"
        sha256 "a0886f5e907cd19728d4c37699db0a3ea4b7e3f4e071c39883446b3322ac5617"
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
