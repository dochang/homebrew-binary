class Yarn < Formula
  desc "Javascript package manager"
  homepage "https://yarnpkg.com/"

  url "https://yarnpkg.com/downloads/1.12.1/yarn-v1.12.1.tar.gz"
  sha256 "09bea8f4ec41e9079fa03093d3b2db7ac5c5331852236d63815f8df42b3ba88d"

  def install
    prefix.install Dir["*"]
  end

  test do
    system bin/"yarn", "--version"
  end
end
