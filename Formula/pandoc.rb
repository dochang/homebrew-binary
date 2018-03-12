class Pandoc < Formula
  desc "Swiss-army knife of markup format conversion"
  homepage "https://pandoc.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/jgm/pandoc/releases/download/2.1.1/pandoc-2.1.1-linux.tar.gz"
        sha256 "cc2a88e6ec5e85819b2e12a944cbeb498cf908176973b6066fc678c2ad95a571"
      when :arm
        url "file://#{__FILE__}"
        version "2.1.1"
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
