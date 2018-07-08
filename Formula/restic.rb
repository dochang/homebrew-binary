class Restic < Formula
  desc "Fast, efficient and secure backup program"
  homepage "https://restic.github.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/restic/restic/releases/download/v0.9.1/restic_0.9.1_linux_amd64.bz2"
        version "0.9.1"
        sha256 "f7f76812fa26ca390029216d1378e5504f18ba5dde790878dfaa84afef29bda7"
      when :arm
        url "https://github.com/restic/restic/releases/download/v0.9.1/restic_0.9.1_linux_arm.bz2"
        version "0.9.1"
        sha256 "0ac18d8f1ea7306f3d76df0d034de4b2ae839027e88a86073f4745cfa181af2c"
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
