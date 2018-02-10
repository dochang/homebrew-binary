class Terraform < Formula
  desc "Tool to build, change, and version infrastructure"
  homepage "https://www.terraform.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip"
        version "0.11.3"
        sha256 "6b8a7b83954597d36bbed23913dd51bc253906c612a070a21db373eab71b277b"
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
