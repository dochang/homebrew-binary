class Flarectl < Formula
  desc "A CLI application for interacting with a Cloudflare account"
  homepage "https://github.com/cloudflare/cloudflare-go/tree/master/cmd/flarectl"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/cloudflare/cloudflare-go/releases/download/v0.8.4/flarectl.linux.amd64"
        sha256 "5548247cb0c11b7b38681d0d2e3d28209aaeb7e17f16d792230685ab16dc52dd"
      when :arm
        url "file://#{__FILE__}"
        version "0.8.4"
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
    system bin/"flarectl", "--version"
  end
end
