class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/gohugoio/hugo/releases/download/v0.36.1/hugo_0.36.1_Linux-64bit.tar.gz"
        version "0.36.1"
        sha256 "c0130f0bf065dbf4930678674d287759b8d7702b2c709c4d15d150513f80199a"
      when :arm
        url "https://github.com/gohugoio/hugo/releases/download/v0.36.1/hugo_0.36.1_Linux-ARM.tar.gz"
        version "0.36.1"
        sha256 "6de321cf797c8fa1a8687687f71781cddb5802c3dae7090cd10484642ae95611"
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
