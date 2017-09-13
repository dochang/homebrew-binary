class Yarn < Formula
  desc "Javascript package manager"
  homepage "https://yarnpkg.com/"

  url "https://yarnpkg.com/downloads/1.0.1/yarn-v1.0.1.tar.gz"
  sha256 "6b00b5e0a7074a512d39d2d91ba6262dde911d452617939ca4be4a700dd77cf1"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/yarn", "--version"
  end
end
