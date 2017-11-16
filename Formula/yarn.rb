class Yarn < Formula
  desc "Javascript package manager"
  homepage "https://yarnpkg.com/"

  url "https://yarnpkg.com/downloads/1.3.2/yarn-v1.3.2.tar.gz"
  sha256 "6cfe82e530ef0837212f13e45c1565ba53f5199eec2527b85ecbcd88bf26821d"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/yarn", "--version"
  end
end
