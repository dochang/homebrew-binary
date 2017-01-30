VERSION = "0.8.5".freeze

CHECKSUMS = {
  linux_amd64: "4b4324e354c26257f0b830eacb0e7cc7e2ced017d78855f74cb9377f1abf1dd7",
}.freeze

class Terraform < Formula
  desc "Tool to build, change, and version infrastructure"
  homepage "https://www.terraform.io/"

  class << self
    def platform
      case
      when OS.linux?
        case
        when Hardware::CPU.intel?
          if Hardware::CPU.is_64_bit?
            return :linux_amd64
          end
        end
      end
      raise "Platform not supported."
    end
  end

  url "https://releases.hashicorp.com/terraform/#{VERSION}/terraform_#{VERSION}_#{platform}.zip"
  version VERSION
  sha256 CHECKSUMS[platform]

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform", "version"
  end
end
