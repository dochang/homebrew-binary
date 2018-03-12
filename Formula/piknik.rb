class Piknik < Formula
  desc "Copy/paste anything over the network"
  homepage "https://github.com/jedisct1/piknik"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/jedisct1/piknik/releases/download/0.9.1/piknik-linux_x86_64-0.9.1.tar.gz"
        sha256 "6343075652835a0508bbc3e6404529d5abdb6c835508a91cfaeddfb759e86f73"
      when :arm
        url "https://github.com/jedisct1/piknik/releases/download/0.9.1/piknik-linux_arm-0.9.1.tar.gz"
        sha256 "7b8bccd31d494c1c8d9ce176f96fd8d9e5a41c9d9a0f9f48d08b12892c2fb90e"
      end
    end
  end

  def install
    bin.install "piknik"
  end

  test do
    system bin/"piknik", "-version"
  end
end
