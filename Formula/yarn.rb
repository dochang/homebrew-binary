class Yarn < Formula
  desc "Javascript package manager"
  homepage "https://yarnpkg.com/"

  url "https://yarnpkg.com/downloads/1.2.1/yarn-v1.2.1.tar.gz"
  sha256 "f8ed07675c3a0b866e11a02af5c15d2f34c3aa261ab1501943ecee328786c959"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/yarn", "--version"
  end
end
