class Sift < Formula
  desc "A fast and powerful alternative to grep"
  homepage "https://sift-tool.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://sift-tool.org/downloads/sift/sift_0.9.0_linux_amd64.tar.gz"
        version "0.9.0"
        sha256 "980a048d2414e042190d45d84e620295629e267deb16cdf3df2b48f0cb0c4db3"
      when :arm
        url "https://sift-tool.org/downloads/sift/sift_0.9.0_linux_arm.tar.gz"
        version "0.9.0"
        sha256 "2d3aae4663105945cc7d88c683ab255bc39dafcb97d4900b81b25bb9ef8238f5"
      end
    end
  end

  def install
    bin.install "sift"
  end

  test do
    system bin/"sift", "--version"
  end
end
