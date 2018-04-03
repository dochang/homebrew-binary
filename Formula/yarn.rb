class Yarn < Formula
  desc "Javascript package manager"
  homepage "https://yarnpkg.com/"

  url "https://yarnpkg.com/downloads/1.5.1/yarn-v1.5.1.tar.gz"
  sha256 "cd31657232cf48d57fdbff55f38bfa058d2fb4950450bd34af72dac796af4de1"

  def install
    prefix.install Dir["*"]
  end

  test do
    system bin/"yarn", "--version"
  end
end
