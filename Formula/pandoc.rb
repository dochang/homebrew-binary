class Pandoc < Formula
  desc "Swiss-army knife of markup format conversion"
  homepage "https://pandoc.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/jgm/pandoc/releases/download/2.4/pandoc-2.4-linux.tar.gz"
        sha256 "64334dcf649a653bf7440dee9f040661357c6eb17d7956cdad600f0f6d3ea9ea"
      when :arm
        url "file://#{__FILE__}"
        version "2.4"
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
