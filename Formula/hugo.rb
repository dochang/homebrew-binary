class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/gohugoio/hugo/releases/download/v0.36/hugo_0.36_Linux-64bit.tar.gz"
        version "0.36"
        sha256 "dc373a46487422f35ddedf4a4d3a490019d6aa4789db2bdf7475ef675bdfdff7"
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
