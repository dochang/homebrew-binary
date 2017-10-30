class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/gohugoio/hugo/releases/download/v0.30.2/hugo_0.30.2_Linux-64bit.tar.gz"
        version "0.30.2"
        sha256 "a192577471f2c5b7a6f26ce8ec6effd9e274ffb8672c1a810af0a6384b4de8cd"
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
