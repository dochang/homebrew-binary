class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://www.packer.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://releases.hashicorp.com/packer/1.1.3/packer_1.1.3_linux_amd64.zip"
        version "1.1.3"
        sha256 "b7982986992190ae50ab2feb310cb003a2ec9c5dcba19aa8b1ebb0d120e8686f"
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
