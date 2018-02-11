class Lnav < Formula
  desc "Curses-based tool for viewing and analyzing log files"
  # lnav.org has an SSL issue: https://github.com/tstack/lnav/issues/401
  homepage "https://github.com/tstack/lnav"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tstack/lnav/releases/download/v0.8.2/lnav-0.8.2-linux-64bit.zip"
        sha256 "ce16ebc4dc05cf825d728daeb0491778e6997b83fb632b418ac1a60e38155022"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "lnav"
  end

  test do
    system "#{bin}/lnav", "-V"
  end
end
