class HaskellStack < Formula
  desc "The Haskell Tool Stack"
  homepage "https://haskellstack.org/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/commercialhaskell/stack/releases/download/v1.5.1/stack-1.5.1-linux-x86_64-static.tar.gz"
        sha256 "6a250cbab60870f6b933c780c96c5cafb02d066a6f2d7182bb00ec005262842b"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "stack"
  end

  test do
    system "#{bin}/stack", "--version"
  end
end
