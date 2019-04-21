class Ripgrep < Formula
  desc "ripgrep combines the usability of The Silver Searcher with the raw speed of grep."
  homepage "https://github.com/BurntSushi/ripgrep"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep-11.0.1-x86_64-unknown-linux-musl.tar.gz"
        sha256 "ce74cabac9b39b1ad55837ec01e2c670fa7e965772ac2647b209e31ead19008c"
      when :arm
        url "https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep-11.0.1-arm-unknown-linux-gnueabihf.tar.gz"
        version "11.0.1"
        sha256 "e44c89371bb1e646186e4fff230d04ea513ab20f904b182aacca7d015c427c33"
      end
    end
  end

  # Put these in a method to fix RuboCop [Metrics/AbcSize][1] error
  #
  # [1]: https://rubocop.readthedocs.io/en/latest/cops_metrics/#metricsabcsize
  def install_doc
    man1.install "doc/rg.1" unless OS.linux? && Hardware::CPU.arch == :arm
    doc.install Dir["doc/*"]
  end

  def install_completions
    bash_completion.install "complete/rg.bash"
    fish_completion.install "complete/rg.fish"
    zsh_completion.install "complete/_rg"
  end

  def install_metafiles
    prefix.install_metafiles
    prefix.install "LICENSE-MIT"
    prefix.install "UNLICENSE"
  end

  def install
    odie "Platform not supported." if active_spec.url == "file://#{__FILE__}"

    bin.install "rg"
    install_doc
    install_completions
    install_metafiles
  end

  test do
    system bin / "rg", "--version"
  end
end
