class Yarn < Formula
  desc "Javascript package manager"
  homepage "https://yarnpkg.com/"

  url "https://yarnpkg.com/downloads/1.12.3/yarn-v1.12.3.tar.gz"
  sha256 "02cd4b589ec22c4bdbd2bc5ebbfd99c5e99b07242ad68a539cb37896b93a24f2"

  def install
    prefix.install Dir["*"]
  end

  test do
    system bin/"yarn", "--version"
  end
end
