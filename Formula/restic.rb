class Restic < Formula
  desc "Fast, efficient and secure backup program"
  homepage "https://restic.github.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/restic/restic/releases/download/v0.9.2/restic_0.9.2_linux_amd64.bz2"
        version "0.9.2"
        sha256 "1ad8a76a9f966da5f7a319c49a6db071a60ebaa24d69e6d86d53d6f2bcaf11ed"
      when :arm
        url "https://github.com/restic/restic/releases/download/v0.9.2/restic_0.9.2_linux_arm.bz2"
        version "0.9.2"
        sha256 "40d9fe8c9f191ab5d0f3e172eadac4fb3aef7a698b895a22ce81102b0a0f270a"
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
