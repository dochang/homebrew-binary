class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/gohugoio/hugo/releases/download/v0.52/hugo_0.52_Linux-64bit.tar.gz"
        version "0.52"
        sha256 "b4d1fe91023e3fe7e92953af12e08344d66ab10a46feb9cbcffbab2b0c14ba44"
      when :arm
        url "https://github.com/gohugoio/hugo/releases/download/v0.52/hugo_0.52_Linux-ARM.tar.gz"
        version "0.52"
        sha256 "25e22e2c100799237f40f952dfdbc22596dda91aa02c007ae4bea97866732def"
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
