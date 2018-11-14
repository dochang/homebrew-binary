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
        url "https://github.com/alecthomas/gometalinter/releases/download/v2.0.11/gometalinter-2.0.11-linux-amd64.tar.gz"
        sha256 "97d8bd0a4d024740964c7fc2ae41276cf5f839ccf0749528ca900942f656d201"
      when :arm
        url "file://#{__FILE__}"
        version "2.0.11"
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
    system bin/"gometalinter", "--version"
  end
end
