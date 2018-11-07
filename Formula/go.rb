class Go < Formula
  desc "The Go programming language"
  homepage "https://golang.org"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://dl.google.com/go/go1.11.2.linux-amd64.tar.gz"
        version "1.11.2"
        sha256 "1dfe664fa3d8ad714bbd15a36627992effd150ddabd7523931f077b3926d736d"
      when :arm
        url "https://dl.google.com/go/go1.11.2.linux-armv6l.tar.gz"
        version "1.11.2"
        sha256 "b9d16a8eb1f7b8fdadd27232f6300aa8b4427e5e4cb148c4be4089db8fb56429"
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
