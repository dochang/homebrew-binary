class Pandoc < Formula
  desc "Swiss-army knife of markup format conversion"
  homepage "https://pandoc.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-linux.tar.gz"
        sha256 "e33e1c7d6518b6cdc9b29ce8de37cc577fc8de2c039b33a3304863196fa59769"
      when :arm
        url "file://#{__FILE__}"
        version "2.5"
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
