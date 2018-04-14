class Terraform < Formula
  desc "Tool to build, change, and version infrastructure"
  homepage "https://www.terraform.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip"
        version "0.11.7"
        sha256 "6b8ce67647a59b2a3f70199c304abca0ddec0e49fd060944c26f666298e23418"
      when :arm
        url "https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_arm.zip"
        version "0.11.7"
        sha256 "bd0bb7ede0864b7c71f0b575ba79f5ea5d656d8d22d554dadb544e781cf66788"
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
