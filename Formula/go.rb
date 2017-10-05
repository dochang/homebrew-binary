class Go < Formula
  desc "The Go programming language"
  homepage "https://golang.org"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz"
        version "1.9.1"
        sha256 "07d81c6b6b4c2dcf1b5ef7c27aaebd3691cdb40548500941f92b221147c5d9c7"
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
