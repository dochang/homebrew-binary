VERSION = "0.23.4".freeze

class Yarn < Formula
  desc "Javascript package manager"
  homepage "https://yarnpkg.com/"

  url "https://yarnpkg.com/downloads/#{VERSION}/yarn-v#{VERSION}.tar.gz"
  sha256 "bab03e63593295969a3ec95c08a476c80eb821e6ea787829a1ac4b4b1c2298d7"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/yarn", "--version"
  end
end
