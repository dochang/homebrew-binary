VERSION = "0.21.3".freeze

class Yarn < Formula
  desc "Javascript package manager"
  homepage "https://yarnpkg.com/"

  url "https://yarnpkg.com/downloads/#{VERSION}/yarn-v#{VERSION}.tar.gz"
  sha256 "0946a4d1abc106c131b700cc31e5c3aa5f2205eb3bb9d17411f8115354a97d5d"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/yarn", "--version"
  end
end
