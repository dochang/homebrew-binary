class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://www.packer.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://releases.hashicorp.com/packer/1.2.3/packer_1.2.3_linux_amd64.zip"
        version "1.2.3"
        sha256 "822fe76c2dfe699f187ef8c44537d10453a1545db620e40b345cf6991a690f7d"
      when :arm
        url "https://releases.hashicorp.com/packer/1.2.3/packer_1.2.3_linux_arm.zip"
        version "1.2.3"
        sha256 "bbc797a9e429e4ec30e03a389e6ebd54197657d6cc32b0f8434aac91cc2f316c"
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
