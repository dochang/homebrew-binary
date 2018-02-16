class GitAnnex < Formula
  desc "Manage files with git without checking in file contents"
  homepage "https://git-annex.branchable.com/"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz"
        version "6.20180112"
        sha256 "ce6a7ce9167c6e0690277696bc7657bc9c6476a837819c6cd5ad4d2bc3a9eaed"
      when :arm
        url "https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-armel.tar.gz"
        version "6.20180112"
        sha256 "eec0be47b49af4cadb3ebd67bda5fd26da3f5c9724ba4ca1e025363b051eeaf7"
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
    system "#{bin}/git-annex", "version"
  end
end
