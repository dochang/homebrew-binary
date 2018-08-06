class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://www.packer.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://releases.hashicorp.com/packer/1.2.5/packer_1.2.5_linux_amd64.zip"
        version "1.2.5"
        sha256 "bc58aa3f3db380b76776e35f69662b49f3cf15cf80420fc81a15ce971430824c"
      when :arm
        url "https://releases.hashicorp.com/packer/1.2.5/packer_1.2.5_linux_arm.zip"
        version "1.2.5"
        sha256 "c5b305707042d441e4d8a291c2c38cfc35d4333c53a7311e27ab424a310b205f"
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
