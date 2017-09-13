class Sift < Formula
  desc "A fast and powerful alternative to grep"
  homepage "https://sift-tool.org/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://sift-tool.org/downloads/sift/sift_0.9.0_linux_amd64.tar.gz"
        version "0.9.0"
        sha256 "980a048d2414e042190d45d84e620295629e267deb16cdf3df2b48f0cb0c4db3"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "sift"
  end

  test do
    system "#{bin}/sift", "--version"
  end
end
