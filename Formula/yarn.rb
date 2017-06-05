VERSION = "0.24.6".freeze

class Yarn < Formula
  desc "Javascript package manager"
  homepage "https://yarnpkg.com/"

  url "https://yarnpkg.com/downloads/#{VERSION}/yarn-v#{VERSION}.tar.gz"
  sha256 "c375ab86d4ca0b46addc5b462280bd42ddefb114ee0025d38044bb4610cd625d"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/yarn", "--version"
  end
end
