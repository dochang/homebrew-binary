# https://github.com/alecthomas/gometalinter/issues/518#issuecomment-418926220
# https://github.com/alecthomas/gometalinter/issues/525#issue-357293196
# https://github.com/alecthomas/gometalinter/issues/534#issuecomment-419704421
# https://github.com/alecthomas/gometalinter/issues/552#issuecomment-434266465

class Gometalinter < Formula
  desc "Concurrently run Go lint tools and normalise their output."
  homepage "https://github.com/alecthomas/gometalinter"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/alecthomas/gometalinter/releases/download/v3.0.0/gometalinter-3.0.0-linux-amd64.tar.gz"
        sha256 "2cab9691fa1f94184ea1df2b69c00990cdf03037c104e6a9deab6815cdbe6a77"
      when :arm
        url "file://#{__FILE__}"
        version "3.0.0"
      end
    end
  end

  def install
    odie "Platform not supported." if active_spec.url == "file://#{__FILE__}"

    buildpath.children.each_entry do |c|
      bin.install c if c.file? && c.executable?
    end

    prefix.install_metafiles
  end

  test do
    system "#{bin}/gometalinter", "--version"
  end
end
