class CloudflareWarp < Formula
  desc "Cloudflare Warp client"
  homepage "https://warp.cloudflare.com"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://bin.equinox.io/c/2ovkwS9YHaP/warp-2018.2.1-linux-amd64.tgz"
        version "2018.2.1"
        sha256 "fd6beb92736fa489596ce903d8487487230ff1c2d6b2684288190736f8effad2"
      when :arm
        url "https://bin.equinox.io/c/2ovkwS9YHaP/warp-2018.2.1-linux-arm.tgz"
        version "2018.2.1"
        sha256 "44e8682c94bf323c6076c155f41dbf474f41a63500133e37261c2b7840261086"
      end
    end
  end

  def install
    bin.install "cloudflare-warp"
  end

  test do
    system bin/"cloudflare-warp", "--version"
  end
end
