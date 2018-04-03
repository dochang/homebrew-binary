class Peco < Formula
  desc "Simplistic interactive filtering tool"
  homepage "https://github.com/peco/peco"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/peco/peco/releases/download/v0.5.3/peco_linux_amd64.tar.gz"
        version "0.5.3"
        sha256 "a64610d163af8370dc1d61dc57daae36a1b3ba98b40f4096898a0b85f7e82c58"
      when :arm
        url "https://github.com/peco/peco/releases/download/v0.5.3/peco_linux_arm.tar.gz"
        version "0.5.3"
        sha256 "6aec41f821eb5add2c035fecc6b3865ed933ff3055f4ee15ed78d27fee0dbf5f"
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
