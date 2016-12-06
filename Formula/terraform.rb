CHECKSUMS = {
  linux_amd64: "5a4f762a194542d38406b9b92c722b57f7910344db084e24c9c43d7719f4aa18",
}.freeze

class Terraform < Formula
  desc "Tool to build, change, and version infrastructure"
  homepage "https://www.terraform.io/"
  version "0.7.13"

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

  url "https://releases.hashicorp.com/terraform/#{version}/terraform_#{version}_#{platform}.zip"
  sha256 CHECKSUMS[platform]

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform", "version"
  end
end
