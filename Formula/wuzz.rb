require "uri"

class Wuzz < Formula
  desc "Interactive cli tool for HTTP inspection"
  homepage "https://github.com/asciimoo/wuzz"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/asciimoo/wuzz/releases/download/v0.4.0/wuzz_linux_amd64"
        version "0.4.0"
        sha256 "5a1443e07a5a9b9bb813804290e87fdd27b544f4fe00ef95fe3b64e7b56459ec"
      when :arm
        url "https://github.com/asciimoo/wuzz/releases/download/v0.4.0/wuzz_linux_arm"
        version "0.4.0"
        sha256 "0b66609df6bb3736e866ffaec1f9a50a24ee257b572ea2010d27d0e8b7576900"
      end
    end
  end

  def install
    uri = URI.parse(active_spec.url)
    basename = File.basename(uri.path)

    bin.install basename => "wuzz"
  end

  test do
    system "#{bin}/wuzz", "--version"
  end
end
