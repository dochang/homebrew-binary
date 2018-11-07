class Neofetch < Formula
  desc "fast, highly customisable system info script"
  homepage "https://github.com/dylanaraps/neofetch"

  url "https://github.com/dylanaraps/neofetch/archive/5.0.0.tar.gz"
  sha256 "2a4f4853bf83b88a037994dbc53a90c8bd5708f5eeb3392f56d4e49c49d995b3"
  head "https://github.com/dylanaraps/neofetch.git"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/neofetch", "--config", "none", "--color_blocks", "off",
           "--disable", "wm", "de", "term", "gpu"
  end
end
