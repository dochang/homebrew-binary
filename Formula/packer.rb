class Packer < Formula
  desc "Tool for creating identical machine images for multiple platforms"
  homepage "https://www.packer.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://releases.hashicorp.com/packer/1.1.1/packer_1.1.1_linux_amd64.zip"
        version "1.1.1"
        sha256 "e407566e2063ac697e0bbf6f2dd334be448d58bed93f44a186408bf1fc54c552"
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
