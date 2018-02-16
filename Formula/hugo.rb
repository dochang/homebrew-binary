class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/gohugoio/hugo/releases/download/v0.36/hugo_0.36_Linux-64bit.tar.gz"
        version "0.36"
        sha256 "dc373a46487422f35ddedf4a4d3a490019d6aa4789db2bdf7475ef675bdfdff7"
      when :arm
        url "https://github.com/gohugoio/hugo/releases/download/v0.36/hugo_0.36_Linux-ARM.tar.gz"
        version "0.36"
        sha256 "948c07213e46a4911a26c1b9283b186409c65500dc10f4793fcde26ddde4a3c8"
      end
    end
  end

  def install
    bin.install "hugo"
  end

  test do
    system "#{bin}/hugo", "version"
  end
end
