class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/gohugoio/hugo/releases/download/v0.27/hugo_0.27_Linux-64bit.tar.gz"
        version "0.27"
        sha256 "225498d516ed8ffc497f923384620b527c510d062679fc61147a6523781f12cf"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "hugo"
  end

  test do
    system "#{bin}/hugo", "version"
  end
end
