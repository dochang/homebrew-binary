class HaskellStack < Formula
  desc "The Haskell Tool Stack"
  homepage "https://haskellstack.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/commercialhaskell/stack/releases/download/v1.6.5/stack-1.6.5-linux-x86_64-static.tar.gz"
        sha256 "f8876fa73c4bb95c1d762073af2dfa4a003d795709ec3fee2f9743ca6a5fedc6"
      when :arm
        url "file://#{__FILE__}"
        version "1.6.5"
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
