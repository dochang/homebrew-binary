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
        version "6.20180808"
        sha256 "07354f8ffbae6a38c819a2a07bcf419bdfb99cdf98d6cc5f0713cd5ca402470b"
      when :arm
        url "https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-armel.tar.gz"
        version "6.20180914"
        sha256 "ed902ef6476fe2c7a5406a46aaca840b7dddf694d8d1136572391a8640a0f24a"
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
