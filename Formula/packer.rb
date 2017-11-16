class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://www.packer.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://releases.hashicorp.com/packer/1.1.2/packer_1.1.2_linux_amd64.zip"
        version "1.1.2"
        sha256 "7e315a6110333d9d4269ac2ec5c68e663d82a4575d3e853996a976875612724b"
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
