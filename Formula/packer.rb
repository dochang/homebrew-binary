class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://www.packer.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://releases.hashicorp.com/packer/1.2.4/packer_1.2.4_linux_amd64.zip"
        version "1.2.4"
        sha256 "258d1baa23498932baede9b40f2eca4ac363b86b32487b36f48f5102630e9fbb"
      when :arm
        url "file://#{__FILE__}"
        version "1.2.4"
      end
    end
  end

  def install
    odie "Platform not supported." if active_spec.url == "file://#{__FILE__}"

    bin.install "packer"
  end

  test do
    system bin/"packer", "version"
  end
end
