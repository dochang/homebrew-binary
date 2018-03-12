class HaskellStack < Formula
  desc "The Haskell Tool Stack"
  homepage "https://haskellstack.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/commercialhaskell/stack/releases/download/v1.6.3/stack-1.6.3-linux-x86_64-static.tar.gz"
        sha256 "c16b6b1fc31edb203dac9cd3745872c25ea088f12ca19dffb368de73e8b2b89b"
      when :arm
        url "file://#{__FILE__}"
        version "1.6.3"
      end
    end
  end

  def install
    odie "Platform not supported." if active_spec.url == "file://#{__FILE__}"

    bin.install "stack"
  end

  test do
    system bin/"stack", "--version"
  end
end
