class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://www.packer.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://releases.hashicorp.com/packer/1.2.0/packer_1.2.0_linux_amd64.zip"
        version "1.2.0"
        sha256 "d1b0fcc4e66dfe4919c25752d028a4e4466921bf0e3f75be3bbf1c85082e8040"
      when :arm
        url "https://releases.hashicorp.com/packer/1.2.0/packer_1.2.0_linux_arm.zip"
        version "1.2.0"
        sha256 "147c6198acbb423322c00925bbb49a4497ccdae915c1f9595b9c132bb5d02a28"
      end
    end
  end

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer", "version"
  end
end
