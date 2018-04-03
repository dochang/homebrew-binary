class Terraform < Formula
  desc "Tool to build, change, and version infrastructure"
  homepage "https://www.terraform.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://releases.hashicorp.com/terraform/0.11.5/terraform_0.11.5_linux_amd64.zip"
        version "0.11.5"
        sha256 "131c440263382c79c7f783b70ff35cd1d03eb31c44f7738d153d95a0b8436ac9"
      when :arm
        url "https://releases.hashicorp.com/terraform/0.11.5/terraform_0.11.5_linux_arm.zip"
        version "0.11.5"
        sha256 "ec4188d32a8bf0d95616d5290c33c1b4528a13c91916784eb1eb80bae830ec4e"
      end
    end
  end

  def install
    bin.install "terraform"
  end

  test do
    system bin/"terraform", "version"
  end
end
