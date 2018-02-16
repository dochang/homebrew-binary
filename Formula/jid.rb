require "uri"

class Jid < Formula
  desc "json incremental digger"
  homepage "https://github.com/simeji/jid"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/simeji/jid/releases/download/0.7.2/jid_linux_amd64.zip"
        version "0.7.2"
        sha256 "57d9e6cb6dcd052d7ffcfddd7bc88fd5a07351a9bdf0575d3355a9921153e177"
      when :arm
        url "https://github.com/simeji/jid/releases/download/0.7.2/jid_linux_arm.zip"
        version "0.7.2"
        sha256 "c6751d375cb32a5ce3e37c50e8a14763747cc495cce7853f560b46046a6f4ada"
      end
    end
  end

  def install
    uri = URI.parse(active_spec.url)
    basename = File.basename(uri.path, ".zip")

    bin.install basename => "jid"
  end

  test do
    system "false"
  end
end
