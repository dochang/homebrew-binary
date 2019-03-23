class Flarectl < Formula
  desc "A CLI application for interacting with a Cloudflare account"
  homepage "https://github.com/cloudflare/cloudflare-go/tree/master/cmd/flarectl"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/cloudflare/cloudflare-go/releases/download/v0.8.5/flarectl.linux.amd64"
        sha256 "af511e425cda323761565ca9d9cc081d955db8100b654bad0659081dfd12ae8d"
      when :arm
        url "file://#{__FILE__}"
        version "0.8.5"
      end
    end
  end

  def install
    odie "Platform not supported." if active_spec.url == "file://#{__FILE__}"

    uri = URI.parse(active_spec.url)
    basename = File.basename(uri.path)

    bin.install basename => "flarectl"
  end

  test do
    system "#{bin}/flarectl", "--version"
  end
end
