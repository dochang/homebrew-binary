VERSION = "0.27.5".freeze

class Yarn < Formula
  desc "Javascript package manager"
  homepage "https://yarnpkg.com/"

  url "https://yarnpkg.com/downloads/#{VERSION}/yarn-v#{VERSION}.tar.gz"
  sha256 "f0f3510246ee74eb660ea06930dcded7b684eac2593aa979a7add84b72517968"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/yarn", "--version"
  end
end
