class Terraform < Formula
  desc "Tool to build, change, and version infrastructure"
  homepage "https://www.terraform.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://releases.hashicorp.com/terraform/0.10.8/terraform_0.10.8_linux_amd64.zip"
        version "0.10.8"
        sha256 "b786c0cf936e24145fad632efd0fe48c831558cc9e43c071fffd93f35e3150db"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform", "version"
  end
end
