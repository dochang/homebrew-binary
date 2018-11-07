class Terraform < Formula
  desc "Tool to build, change, and version infrastructure"
  homepage "https://www.terraform.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip"
        version "0.11.10"
        sha256 "43543a0e56e31b0952ea3623521917e060f2718ab06fe2b2d506cfaa14d54527"
      when :arm
        url "https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_arm.zip"
        version "0.11.10"
        sha256 "434ca3420ed4b671aab744559f913d94c0ba1fbae0bacf30aa5fd7e57c4bc7f3"
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
