class Yarn < Formula
  desc "Javascript package manager"
  homepage "https://yarnpkg.com/"

  url "https://yarnpkg.com/downloads/1.6.0/yarn-v1.6.0.tar.gz"
  sha256 "a57b2fdb2bfeeb083d45a883bc29af94d5e83a21c25f3fc001c295938e988509"

  def install
    prefix.install Dir["*"]
  end

  test do
    system bin/"yarn", "--version"
  end
end
