class Terraform < Formula
  desc "Tool to build, change, and version infrastructure"
  homepage "https://www.terraform.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://releases.hashicorp.com/terraform/0.10.4/terraform_0.10.4_linux_amd64.zip"
        version "0.10.4"
        sha256 "cff83f669d0e4ac315e792a57659d5aae8ea1fcfdca6931c7cc4679b4e6c60e3"
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
