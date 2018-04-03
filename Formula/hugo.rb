class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/gohugoio/hugo/releases/download/v0.38/hugo_0.38_Linux-64bit.tar.gz"
        version "0.38"
        sha256 "4c21cd4e3551fe2d0cd6bafa1825ac8f161f4a18555611193ce88570b302f533"
      when :arm
        url "https://github.com/gohugoio/hugo/releases/download/v0.38/hugo_0.38_Linux-ARM.tar.gz"
        version "0.38"
        sha256 "de858d868707cc23e2ae2268a437e560ee945bc028eb37e45980a4a06855886e"
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
