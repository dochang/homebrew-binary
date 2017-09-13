class Go < Formula
  desc "The Go programming language"
  homepage "https://golang.org"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz"
        version "1.9"
        sha256 "d70eadefce8e160638a9a6db97f7192d8463069ab33138893ad3bf31b0650a79"
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
