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
        version "6.20180719"
        sha256 "fa14d666591c3565c77c6ef0a43b41575fa55f1b41e8c910defef10931738d56"
      when :arm
        url "https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-armel.tar.gz"
        version "6.20180626"
        sha256 "2aa7d88f31710135da7189f1395423b04e8318b8ffa13d5b204a271fe4ec5ec3"
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
