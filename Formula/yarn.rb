VERSION = "0.23.2".freeze

class Yarn < Formula
  desc "Javascript package manager"
  homepage "https://yarnpkg.com/"

  url "https://yarnpkg.com/downloads/#{VERSION}/yarn-v#{VERSION}.tar.gz"
  sha256 "2e4f3c5eb0bddad10fdc08a300ab43fe0f626544893deb9e07a4497e998cb82f"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/yarn", "--version"
  end
end
