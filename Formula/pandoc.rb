class Pandoc < Formula
  desc "Swiss-army knife of markup format conversion"
  homepage "https://pandoc.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/jgm/pandoc/releases/download/2.2/pandoc-2.2-linux.tar.gz"
        sha256 "06ecd882e42ef9b7390b1c82e1e71b3ea48679181289b9b810a8797825bed8ed"
      when :arm
        url "file://#{__FILE__}"
        version "2.2"
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
