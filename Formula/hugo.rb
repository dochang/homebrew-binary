class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/gohugoio/hugo/releases/download/v0.31.1/hugo_0.31.1_Linux-64bit.tar.gz"
        version "0.31.1"
        sha256 "2ec6fd0493fa246a5747b0f1875d94affaaa30f11715f26abcbe1bc91c940716"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "hugo"
  end

  test do
    system "#{bin}/hugo", "version"
  end
end
