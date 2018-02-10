class GitAnnex < Formula
  desc "Manage files with git without checking in file contents"
  homepage "https://git-annex.branchable.com/"

  case
  when OS.linux?
    case
    when Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz"
        version "6.20180112"
        sha256 "ce6a7ce9167c6e0690277696bc7657bc9c6476a837819c6cd5ad4d2bc3a9eaed"
      end
    end
  end

  unless stable.url
    raise "Platform not supported."
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
