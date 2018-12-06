class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://www.packer.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://releases.hashicorp.com/packer/1.3.3/packer_1.3.3_linux_amd64.zip"
        version "1.3.3"
        sha256 "efa311336db17c0709d5069509c34c35f0d59c63dfb05f61d4572c5a26b563ea"
      when :arm
        url "https://releases.hashicorp.com/packer/1.3.3/packer_1.3.3_linux_arm.zip"
        version "1.3.3"
        sha256 "1147211a92354f08733dfbbc8e9e9cc02a84773c4a10c97c76eafe8347d1d406"
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
