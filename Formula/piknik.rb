class Piknik < Formula
  desc "Copy/paste anything over the network"
  homepage "https://github.com/jedisct1/piknik"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jedisct1/piknik/releases/download/0.9.1/piknik-linux_x86_64-0.9.1.tar.gz"
        sha256 "6343075652835a0508bbc3e6404529d5abdb6c835508a91cfaeddfb759e86f73"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "piknik"
  end

  test do
    system "#{bin}/piknik", "-version"
  end
end
