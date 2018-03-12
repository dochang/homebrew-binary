class Lnav < Formula
  desc "Curses-based tool for viewing and analyzing log files"
  # lnav.org has an SSL issue: https://github.com/tstack/lnav/issues/401
  homepage "https://github.com/tstack/lnav"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/tstack/lnav/releases/download/v0.8.3/lnav-0.8.3-linux-64bit.zip"
        sha256 "d20c44f0159a1a34f21854bb90fd7cde0054dfaa831dd4c3b9b362a7db3feab0"
      when :arm
        url "file://#{__FILE__}"
        version "0.8.3"
      end
    end
  end

  def install
    odie "Platform not supported." if active_spec.url == "file://#{__FILE__}"

    bin.install "lnav"
  end

  test do
    system bin/"lnav", "-V"
  end
end
