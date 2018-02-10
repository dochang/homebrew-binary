class Go < Formula
  desc "The Go programming language"
  homepage "https://golang.org"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://dl.google.com/go/go1.9.4.linux-amd64.tar.gz"
        version "1.9.4"
        sha256 "15b0937615809f87321a457bb1265f946f9f6e736c563d6c5e0bd2c22e44f779"
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
