class Pass < Formula
  desc "Password manager"
  homepage "https://www.passwordstore.org/"
  url "https://git.zx2c4.com/password-store/snapshot/password-store-1.7.2.tar.xz"
  sha256 "4768c5e1965c4d2aeb28818681e484fb105b6f46cbd75a97608615c4ec6980ea"
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
