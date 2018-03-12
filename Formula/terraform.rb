class Terraform < Formula
  desc "Tool to build, change, and version infrastructure"
  homepage "https://www.terraform.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip"
        version "0.11.3"
        sha256 "6b8a7b83954597d36bbed23913dd51bc253906c612a070a21db373eab71b277b"
      when :arm
        url "https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_arm.zip"
        version "0.11.3"
        sha256 "557e5f37633c88128f323cfbaf53b4bd05c74f2b91a11dacf889bdd56af40c5d"
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
