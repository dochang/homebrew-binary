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
        version "7.20181106"
        sha256 "afe0ac5166790cab8b05aa41e32c20fd252de9c5235eeb93aa0e6b6ade9f40e5"
      when :arm
        url "https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-armel.tar.gz"
        version "7.20181106"
        sha256 "b59f08349226793d155d055671894e9925a0a5ceb57070775e3ecc6f1b8f2fd3"
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
