class Go < Formula
  desc "The Go programming language"
  homepage "https://golang.org"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://dl.google.com/go/go1.9.2.linux-amd64.tar.gz"
        version "1.9.2"
        sha256 "de874549d9a8d8d8062be05808509c09a88a248e77ec14eb77453530829ac02b"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/go", "version"
  end
end
