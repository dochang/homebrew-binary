class HaskellStack < Formula
  desc "The Haskell Tool Stack"
  homepage "https://haskellstack.org/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/commercialhaskell/stack/releases/download/v1.7.1/stack-1.7.1-linux-x86_64.tar.gz"
        sha256 "647306bbf65dd0b555486e2a32776ba1cfe0c8f380e31c6aa93abd452cb209ee"
      when :arm
        url "https://github.com/commercialhaskell/stack/releases/download/v1.7.1/stack-1.7.1-linux-arm.tar.gz"
        sha256 "0d79990b7d38c41203a031c842938c7fdc280f5d5d4f411cd91c7c53609eff76"
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
