class Jid < Formula
  desc "json incremental digger"
  homepage "https://github.com/simeji/jid"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/simeji/jid/releases/download/0.7.2/jid_linux_amd64.zip"
        version "0.7.2"
        sha256 "57d9e6cb6dcd052d7ffcfddd7bc88fd5a07351a9bdf0575d3355a9921153e177"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
  end

  def install
    bin.install "jid_#{self.class.platform}" => "jid"
  end

  test do
    system "false"
  end
end
