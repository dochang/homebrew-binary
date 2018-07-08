class Yarn < Formula
  desc "Javascript package manager"
  homepage "https://yarnpkg.com/"

  url "https://yarnpkg.com/downloads/1.7.0/yarn-v1.7.0.tar.gz"
  sha256 "e7720ee346b2bd7ec32b7e04517643c38648f5022c7981168321ba1636f2dca3"

  def install
    prefix.install Dir["*"]
  end

  test do
    system bin/"yarn", "--version"
  end
end
