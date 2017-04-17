VERSION = "0.9.3".freeze

CHECKSUMS = {
  linux_amd64: "f34b96f7b7edaf8c4dc65f6164ba0b8f21195f5cbe5b7288ad994aa9794bb607",
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
