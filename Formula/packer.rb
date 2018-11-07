class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://www.packer.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://releases.hashicorp.com/packer/1.3.2/packer_1.3.2_linux_amd64.zip"
        version "1.3.2"
        sha256 "5e51808299135fee7a2e664b09f401b5712b5ef18bd4bad5bc50f4dcd8b149a1"
      when :arm
        url "https://releases.hashicorp.com/packer/1.3.2/packer_1.3.2_linux_arm.zip"
        version "1.3.2"
        sha256 "1ec7416ebf6170c34b4005363eaed5ae8611b7816f0806c36ed17602b0661622"
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
