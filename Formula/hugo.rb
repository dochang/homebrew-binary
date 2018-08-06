class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/gohugoio/hugo/releases/download/v0.46/hugo_0.46_Linux-64bit.tar.gz"
        version "0.46"
        sha256 "96c431b1b76aed4833739966235098162b97ca9933e1ff2bcd09f7571842ea6b"
      when :arm
        url "https://github.com/gohugoio/hugo/releases/download/v0.46/hugo_0.46_Linux-ARM.tar.gz"
        version "0.46"
        sha256 "fdd1309b8ebd13b9a3795439c09ab2a151bbbe31c057864e3de9d3b72029ca7b"
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
