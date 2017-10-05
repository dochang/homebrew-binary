class Yarn < Formula
  desc "Javascript package manager"
  homepage "https://yarnpkg.com/"

  url "https://yarnpkg.com/downloads/1.1.0/yarn-v1.1.0.tar.gz"
  sha256 "171c1f9ee93c488c0d774ac6e9c72649047c3f896277d88d0f805266519430f3"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/yarn", "--version"
  end
end
