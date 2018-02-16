class Lnav < Formula
  desc "Curses-based tool for viewing and analyzing log files"
  # lnav.org has an SSL issue: https://github.com/tstack/lnav/issues/401
  homepage "https://github.com/tstack/lnav"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/tstack/lnav/releases/download/v0.8.2/lnav-0.8.2-linux-64bit.zip"
        sha256 "ce16ebc4dc05cf825d728daeb0491778e6997b83fb632b418ac1a60e38155022"
      when :arm
        url "file://#{__FILE__}"
        version "0.8.2"
      end
    end
  end

  def install
    odie "Platform not supported." if active_spec.url == "file://#{__FILE__}"

    bin.install "lnav"
  end

  test do
    system "#{bin}/lnav", "-V"
  end
end
