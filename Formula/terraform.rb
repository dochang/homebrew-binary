class Terraform < Formula
  desc "Tool to build, change, and version infrastructure"
  homepage "https://www.terraform.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://releases.hashicorp.com/terraform/0.10.7/terraform_0.10.7_linux_amd64.zip"
        version "0.10.7"
        sha256 "8fb5f587fcf67fd31d547ec53c31180e6ab9972e195905881d3dddb8038c5a37"
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
