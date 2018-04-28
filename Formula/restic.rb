class Restic < Formula
  desc "Fast, efficient and secure backup program"
  homepage "https://restic.github.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/restic/restic/releases/download/v0.8.3/restic_0.8.3_linux_amd64.bz2"
        version "0.8.3"
        sha256 "1e9aca80c4f4e263c72a83d4333a9dac0e24b24e1fe11a8dc1d9b38d77883705"
      when :arm
        url "https://github.com/restic/restic/releases/download/v0.8.3/restic_0.8.3_linux_arm.bz2"
        version "0.8.3"
        sha256 "6f252952b482ffac286cfec43774b6f510ad7f47eb7332ce8bbddc1400a91ec3"
      end
    end
  end

  def install
    uri = URI.parse(active_spec.url)
    basename = File.basename(uri.path, ".bz2")

    bin.install basename => "restic"
  end

  test do
    system bin/"restic", "version"
  end
end
