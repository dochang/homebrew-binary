class GitAnnex < Formula
  desc "Manage files with git without checking in file contents"
  homepage "https://git-annex.branchable.com/"

  # Check [hackage] page for new versions
  #
  # [hackage]: https://hackage.haskell.org/package/git-annex
  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz"
        version "6.20180316"
        sha256 "f5b4acd2a7ec49b7644c311eba7097567cbd8df23175b1c8cab08a4076d0a8c8"
      when :arm
        url "https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-armel.tar.gz"
        version "6.20180316"
        sha256 "b2268c08d611984adce7bff30c5ebd5e88bac47cf48703034e26660a6405f54a"
      end
    end
  end

  def install
    bin.install "shimmed/git-annex/git-annex"
    bin.install_symlink "git-annex" => "git-annex-shell"
    bin.install_symlink "git-annex" => "git-remote-tor-annex"
    man.install "usr/share/man/man1"
  end

  test do
    system bin/"git-annex", "version"
  end
end
