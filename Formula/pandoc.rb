class Pandoc < Formula
  desc "Swiss-army knife of markup format conversion"
  homepage "https://pandoc.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/jgm/pandoc/releases/download/2.7.2/pandoc-2.7.2-linux.tar.gz"
        sha256 "6741f73e37a900deee56bc2dc71c2893fb28e0961557db36eb029368de5183c2"
      when :arm
        url "file://#{__FILE__}"
        version "2.7.2"
      end
    end
  end

  def install
    odie "Platform not supported." if active_spec.url == "file://#{__FILE__}"

    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/pandoc", "--version"
  end
end
