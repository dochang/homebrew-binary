class HaskellStack < Formula
  desc "The Haskell Tool Stack"
  homepage "https://haskellstack.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/commercialhaskell/stack/releases/download/v1.9.3/stack-1.9.3-linux-x86_64-static.tar.gz"
        version "1.9.3"
        sha256 "c9bf6d371b51de74f4bfd5b50965966ac57f75b0544aebb59ade22195d0b7543"
      when :arm
        url "https://github.com/commercialhaskell/stack/releases/download/v1.9.3/stack-1.9.3-linux-arm.tar.gz"
        sha256 "96394b616e29b3bd2479a3712e2c0c375a7cfd748b613f7c6c3186d7ae92977b"
      end
    end
  end

  def install
    bin.install "stack"
  end

  test do
    system bin/"stack", "--version"
  end
end
