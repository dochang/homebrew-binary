class Hugo < Formula
  desc "Configurable static site generator"
  homepage "https://gohugo.io/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/gohugoio/hugo/releases/download/v0.40.1/hugo_0.40.1_Linux-64bit.tar.gz"
        version "0.40.1"
        sha256 "004af6326a331f7e0e2ae2145a4263e36c9a15cb9dcf1d0d9dac4bbdf6d678d5"
      when :arm
        url "https://github.com/gohugoio/hugo/releases/download/v0.40.1/hugo_0.40.1_Linux-ARM.tar.gz"
        version "0.40.1"
        sha256 "c77690927867caccc2ba1d33443161c7af732dc9622a23aee95d6dc60c6a2851"
      end
    end
  end

  def install
    bin.install "hugo"
  end

  test do
    system bin/"hugo", "version"
  end
end
