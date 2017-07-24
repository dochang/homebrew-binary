VERSION = "1.37".freeze

CHECKSUMS = {
  "linux-amd64" => "a0886f5e907cd19728d4c37699db0a3ea4b7e3f4e071c39883446b3322ac5617",
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
