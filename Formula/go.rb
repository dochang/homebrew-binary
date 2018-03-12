class Go < Formula
  desc "The Go programming language"
  homepage "https://golang.org"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://dl.google.com/go/go1.10.linux-amd64.tar.gz"
        version "1.10"
        sha256 "b5a64335f1490277b585832d1f6c7f8c6c11206cba5cd3f771dcb87b98ad1a33"
      when :arm
        url "https://dl.google.com/go/go1.10.linux-armv6l.tar.gz"
        version "1.10"
        sha256 "6ff665a9ab61240cf9f11a07e03e6819e452a618a32ea05bbb2c80182f838f4f"
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
