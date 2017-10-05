class Neofetch < Formula
  desc "fast, highly customisable system info script"
  homepage "https://github.com/dylanaraps/neofetch"

  url "https://github.com/dylanaraps/neofetch/archive/3.3.0.tar.gz"
  sha256 "4808e76bd81da3602cb5be7e01dfed8223b1109e2792755dd0d54126014ee696"
  head "https://github.com/dylanaraps/neofetch.git"

  def install
    # We can't use `make install` here.  `get_script_dir` in neofetch returns
    # script dir, which ends with `/bin` in Linuxbrew.  This makes neofetch
    # unable to access resources.
    #
    # We install neofetch as its git repository layout.
    prefix.install "neofetch", "ascii", "config"
    # But we still install manpage into `share/man`, because Homebrew/Linuxbrew
    # finds manual pages in `share/man/...`, and not in `man/...`.  See [1].
    #
    # [1]: https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md#manuals
    man1.install "neofetch.1"
    # Symlink `neofetch` into `bin`.  This makes Homebrew/Linuxbrew correctly
    # links the script.
    bin.install_symlink "../neofetch"
  end

  test do
    system "#{bin}/neofetch", "--test", "--config off"
  end
end
