class Go < Formula
  desc "The Go programming language"
  homepage "https://golang.org"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://dl.google.com/go/go1.9.4.linux-amd64.tar.gz"
        version "1.9.4"
        sha256 "15b0937615809f87321a457bb1265f946f9f6e736c563d6c5e0bd2c22e44f779"
      when :arm
        url "https://dl.google.com/go/go1.9.4.linux-armv6l.tar.gz"
        version "1.9.4"
        sha256 "3c8cf3f79754a9fd6b33e2d8f930ee37d488328d460065992c72bc41c7b41a49"
      end
    end
  end

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/go", "version"
  end
end
