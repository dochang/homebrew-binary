class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/gohugoio/hugo/releases/download/v0.29/hugo_0.29_Linux-64bit.tar.gz"
        version "0.29"
        sha256 "80011b40b64781a5adfbf882fe3ab3b3c526e9ba8583fb532cd2331ffbe44a9e"
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
