class Yarn < Formula
  desc "Javascript package manager"
  homepage "https://yarnpkg.com/"

  url "https://yarnpkg.com/downloads/1.9.4/yarn-v1.9.4.tar.gz"
  sha256 "7667eb715077b4bad8e2a832e7084e0e6f1ba54d7280dc573c8f7031a7fb093e"

  def install
    prefix.install Dir["*"]
  end

  test do
    system bin/"yarn", "--version"
  end
end
