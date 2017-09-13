class Wuzz < Formula
  desc "Interactive cli tool for HTTP inspection"
  homepage "https://github.com/asciimoo/wuzz"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/asciimoo/wuzz/releases/download/v0.4.0/wuzz_linux_amd64"
        version "0.4.0"
        sha256 "5a1443e07a5a9b9bb813804290e87fdd27b544f4fe00ef95fe3b64e7b56459ec"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "wuzz_#{self.class.platform}" => "wuzz"
  end

  test do
    system "#{bin}/wuzz", "--version"
  end
end
