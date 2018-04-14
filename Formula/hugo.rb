class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/gohugoio/hugo/releases/download/v0.38.2/hugo_0.38.2_Linux-64bit.tar.gz"
        version "0.38.2"
        sha256 "9e5b7cd79e4732c4fdf82210450e39cc588935fdc8ecf4a590219d7b4b2a389a"
      when :arm
        url "https://github.com/gohugoio/hugo/releases/download/v0.38.2/hugo_0.38.2_Linux-ARM.tar.gz"
        version "0.38.2"
        sha256 "9878b7cb91acc29ea6785604775c68ea8e95a677aec4755596a6959762cc1c69"
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
