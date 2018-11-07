class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/gohugoio/hugo/releases/download/v0.50/hugo_0.50_Linux-64bit.tar.gz"
        version "0.50"
        sha256 "5e04ffe2e7cb0c3e1c364faca37a7f2e3e94db3d36d94ee290e3a3e1557dfc9a"
      when :arm
        url "https://github.com/gohugoio/hugo/releases/download/v0.50/hugo_0.50_Linux-ARM.tar.gz"
        version "0.50"
        sha256 "f29a43ab219630d36076b6675599e3bfc1d719595ef007f9f7285fcabb994845"
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
