class Restic < Formula
  desc "Fast, efficient and secure backup program"
  homepage "https://restic.github.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/restic/restic/releases/download/v0.9.3/restic_0.9.3_linux_amd64.bz2"
        version "0.9.3"
        sha256 "3c882962fc07f611a6147ada99c9909770d3e519210fd483cde9609c6bdd900c"
      when :arm
        url "https://github.com/restic/restic/releases/download/v0.9.3/restic_0.9.3_linux_arm.bz2"
        version "0.9.3"
        sha256 "870d0643bce12a91a51947e9fee61b2ccd3b0fd12c21e81bcfcdfd6248f4c287"
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
