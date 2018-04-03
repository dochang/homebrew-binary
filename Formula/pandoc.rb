class Pandoc < Formula
  desc "Swiss-army knife of markup format conversion"
  homepage "https://pandoc.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/jgm/pandoc/releases/download/2.1.3/pandoc-2.1.3-linux.tar.gz"
        sha256 "829f7022b6bf5164ad5aabb88ad18d432e2ed15b11625d14ca76eee476c16a2d"
      when :arm
        url "file://#{__FILE__}"
        version "2.1.3"
      end
    end
  end

  def install
    odie "Platform not supported." if active_spec.url == "file://#{__FILE__}"

    prefix.install Dir["*"]
  end

  test do
    system bin/"pandoc", "--version"
  end
end
