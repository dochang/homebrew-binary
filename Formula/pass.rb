class Pass < Formula
  desc "Password manager"
  homepage "https://www.passwordstore.org/"
  url "https://git.zx2c4.com/password-store/snapshot/password-store-1.7.1.tar.xz"
  sha256 "f6d2199593398aaefeaa55e21daddfb7f1073e9e096af6d887126141e99d9869"
  revision 1
  head "https://git.zx2c4.com/password-store", :using => :git

  def install
    system "make", "PREFIX=#{prefix}", "WITH_ALLCOMP=yes", "BASHCOMPDIR=#{bash_completion}", "ZSHCOMPDIR=#{zsh_completion}", "FISHCOMPDIR=#{fish_completion}", "install"
    elisp.install "contrib/emacs/password-store.el"
    pkgshare.install "contrib"
  end

  test do
    system bin/"pass", "version"
  end
end
