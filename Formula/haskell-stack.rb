class HaskellStack < Formula
  desc "The Haskell Tool Stack"
  homepage "https://haskellstack.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/commercialhaskell/stack/releases/download/v1.9.1/stack-1.9.1-linux-x86_64-static.tar.gz"
        sha256 "332e5d0421e7a1afc96985050d985c0d2ba651f91dc2565faa5abfdef9d2a095"
      when :arm
        url "https://github.com/commercialhaskell/stack/releases/download/v1.9.1/stack-1.9.1-linux-arm.tar.gz"
        sha256 "c400d6403d6d138754056327465cec7ef113d75b5d7ee26e9476268ca1dd946f"
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
