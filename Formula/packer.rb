class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://www.packer.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://releases.hashicorp.com/packer/1.1.0/packer_1.1.0_linux_amd64.zip"
        version "1.1.0"
        sha256 "bd1eddfa114f7e6258ef3419613380297f1b4e438f5bae92f1177150519be934"
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
