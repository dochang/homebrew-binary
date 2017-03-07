VERSION = "0.8.8".freeze

CHECKSUMS = {
  linux_amd64: "403d65b8a728b8dffcdd829262b57949bce9748b91f2e82dfd6d61692236b376",
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
