class GitAnnex < Formula
  desc "Manage files with git without checking in file contents"
  homepage "https://git-annex.branchable.com/"

  # Check [hackage] page for new versions
  #
  # [hackage]: https://hackage.haskell.org/package/git-annex
  #
  # Use `strings git-annex.linux/shimmed/git-annex/git-annex` to find the
  # version.
  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz"
        version "7.20190322"
        sha256 "3d3056644122ff10a338e22574a93d81d7d49ca1a4f98cc2ae6989a579ce3470"
      when :arm
        url "https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-armel.tar.gz"
        version "7.20190220"
        sha256 "ca903fc6d8aaa24141dc0efa56b94650a98993096efa1f69de401c8b1f0e30c4"
      end
    end
  end

  def pkgname
    "git-annex.linux"
  end

  # Put these in a method to fix RuboCop [Metrics/AbcSize][1] error
  #
  # [1]: https://rubocop.readthedocs.io/en/latest/cops_metrics/#metricsabcsize
  def install_bin
    bin.install_symlink "../opt/#{pkgname}/git-annex"
    bin.install_symlink "../opt/#{pkgname}/git-annex-shell"
    bin.install_symlink "../opt/#{pkgname}/git-annex" => "git-remote-tor-annex"
  end

  def install
    (prefix/"opt"/pkgname).install Dir["*"]
    install_bin
    # No need to install man pages, since git-annex is a shell wrapper that
    # overrides related variables.
  end

  test do
    system bin/"git-annex", "version"
  end
end
