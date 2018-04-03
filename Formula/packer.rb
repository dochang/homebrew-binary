class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://www.packer.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://releases.hashicorp.com/packer/1.2.2/packer_1.2.2_linux_amd64.zip"
        version "1.2.2"
        sha256 "6575f8357a03ecad7997151234b1b9f09c7a5cf91c194b23a461ee279d68c6a8"
      when :arm
        url "https://releases.hashicorp.com/packer/1.2.2/packer_1.2.2_linux_arm.zip"
        version "1.2.2"
        sha256 "fc0667a5774f042739f258e7156d1f7a628920d2ebfc916aa0791ca056080230"
      end
    end
  end

  def install
    bin.install "packer"
  end

  test do
    system bin/"packer", "version"
  end
end
