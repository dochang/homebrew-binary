class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/gohugoio/hugo/releases/download/v0.42.2/hugo_0.42.2_Linux-64bit.tar.gz"
        version "0.42.2"
        sha256 "7759102158b592ef6e96c60f0409e99a476ef550dc8f3b529242aa9cc321c862"
      when :arm
        url "https://github.com/gohugoio/hugo/releases/download/v0.42.2/hugo_0.42.2_Linux-ARM.tar.gz"
        version "0.42.2"
        sha256 "20d569a9283c89f3b3e7f27915df3edd9b46b849b19570414f0ac2ca04f3d7fb"
      end
    end
  end

  def install
    bin.install "hugo"
  end

  test do
    system bin/"hugo", "version"
  end
end
