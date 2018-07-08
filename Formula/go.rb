class Go < Formula
  desc "The Go programming language"
  homepage "https://golang.org"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz"
        version "1.10.3"
        sha256 "fa1b0e45d3b647c252f51f5e1204aba049cde4af177ef9f2181f43004f901035"
      when :arm
        url "https://dl.google.com/go/go1.10.3.linux-armv6l.tar.gz"
        version "1.10.3"
        sha256 "d3df3fa3d153e81041af24f31a82f86a21cb7b92c1b5552fb621bad0320f06b6"
      end
    end
  end

  def install
    prefix.install Dir["*"]
  end

  test do
    system bin/"go", "version"
  end
end
