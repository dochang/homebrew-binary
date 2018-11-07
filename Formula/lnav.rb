class Lnav < Formula
  desc "Curses-based tool for viewing and analyzing log files"
  # lnav.org has an SSL issue: https://github.com/tstack/lnav/issues/401
  homepage "https://github.com/tstack/lnav"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/tstack/lnav/releases/download/v0.8.4/lnav-0.8.4-linux-64bit.zip"
        sha256 "eae0e6f84a257b8192156fe0daf82b0bcd4dd05bd4c7ce948f49b8719bf9d090"
      when :arm
        url "file://#{__FILE__}"
        version "0.8.4"
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
