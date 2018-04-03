class Go < Formula
  desc "The Go programming language"
  homepage "https://golang.org"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://dl.google.com/go/go1.10.1.linux-amd64.tar.gz"
        version "1.10.1"
        sha256 "72d820dec546752e5a8303b33b009079c15c2390ce76d67cf514991646c6127b"
      when :arm
        url "https://dl.google.com/go/go1.10.1.linux-armv6l.tar.gz"
        version "1.10.1"
        sha256 "feca4e920d5ca25001dc0823390df79bc7ea5b5b8c03483e5a2c54f164654936"
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
