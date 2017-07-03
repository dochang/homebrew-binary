VERSION = "1.36".freeze

CHECKSUMS = {
  "linux-amd64" => "aa34d338e9144df8a34bb60a9bc3a38d32b357dbce73a2c03523e4d070e8d935",
}.freeze

class Rclone < Formula
  desc "rsync for cloud storage"
  homepage "https://rclone.org/"

  class << self
    def platform
      case
      when OS.linux?
        case
        when Hardware::CPU.intel?
          if Hardware::CPU.is_64_bit?
            return "linux-amd64"
          end
        end
      end
      raise "Platform not supported."
    end
  end

  url "https://downloads.rclone.org/rclone-v#{VERSION}-#{platform}.zip"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "rclone"
    man1.install "rclone.1"
  end

  test do
    system "#{bin}/rclone", "version"
  end
end
