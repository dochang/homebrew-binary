class Rclone < Formula
  desc "rsync for cloud storage"
  homepage "https://rclone.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://downloads.rclone.org/v1.45/rclone-v1.45-linux-amd64.zip"
        version "1.45"
        sha256 "6bdfc45e64808d24883600ad5a09750a3417ebf18a16684e6cfa60029edb7278"
      when :arm
        url "https://downloads.rclone.org/v1.45/rclone-v1.45-linux-arm.zip"
        version "1.45"
        sha256 "39ff09aca7ef87a4a68bc0381a1bb39cf2b54504fd6367f25dff496790e47668"
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
