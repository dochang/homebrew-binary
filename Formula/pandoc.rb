class Pandoc < Formula
  desc "Swiss-army knife of markup format conversion"
  homepage "https://pandoc.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/jgm/pandoc/releases/download/2.2.2.1/pandoc-2.2.2.1-linux.tar.gz"
        sha256 "c04d02033ff8d1c7dd4201419089bd5cdc62ef4b8af622f4f965788869732d7b"
      when :arm
        url "file://#{__FILE__}"
        version "2.2.2.1"
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
