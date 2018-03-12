class Peco < Formula
  desc "Simplistic interactive filtering tool"
  homepage "https://github.com/peco/peco"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/peco/peco/releases/download/v0.5.2/peco_linux_amd64.tar.gz"
        version "0.5.2"
        sha256 "3dfb85c44c68cd10584c9813f96bd979ae1118735819eda9588cc4ef8adcb99f"
      when :arm
        url "https://github.com/peco/peco/releases/download/v0.5.2/peco_linux_arm.tar.gz"
        version "0.5.2"
        sha256 "ccb179e53f15d4b230bb4d40d822e9896d63d855126cab0277164710d8c8ea23"
      end
    end
  end

  def install
    bin.install "peco"
  end

  test do
    system bin/"peco", "--version"
  end
end
