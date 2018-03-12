require "uri"

class Whalebrew < Formula
  desc "Homebrew, but with Docker images"
  homepage "https://github.com/bfirsh/whalebrew"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/bfirsh/whalebrew/releases/download/0.1.0/whalebrew-Linux-x86_64"
        version "0.1.0"
        sha256 "f776cb3bc40fde0cd221e38159d2fa3a7933c4f8cf40a1dad257a09edb0e4af4"
      when :arm
        url "file://#{__FILE__}"
        version "0.1.0"
      end
    end
  end

  def install
    odie "Platform not supported." if active_spec.url == "file://#{__FILE__}"

    uri = URI.parse(active_spec.url)
    basename = File.basename(uri.path)

    bin.install basename => "whalebrew"
  end

  test do
    system bin/"whalebrew", "version"
  end
end
