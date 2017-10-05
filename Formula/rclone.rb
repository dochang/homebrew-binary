class Rclone < Formula
  desc "rsync for cloud storage"
  homepage "https://rclone.org/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.rclone.org/rclone-v1.38-linux-amd64.zip"
        version "1.38"
        sha256 "69bcd262f6e67eaa9f28f93460d73ad8a73612745d3c7a2bdd03d4cf85d43090"
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
