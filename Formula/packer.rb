class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://www.packer.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://releases.hashicorp.com/packer/1.2.0/packer_1.2.0_linux_amd64.zip"
        version "1.2.0"
        sha256 "d1b0fcc4e66dfe4919c25752d028a4e4466921bf0e3f75be3bbf1c85082e8040"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer", "version"
  end
end
