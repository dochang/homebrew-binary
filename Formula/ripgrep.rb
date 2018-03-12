class Ripgrep < Formula
  desc "ripgrep combines the usability of The Silver Searcher with the raw speed of grep."
  homepage "https://github.com/BurntSushi/ripgrep"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/BurntSushi/ripgrep/releases/download/0.8.0/ripgrep-0.8.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "621f2f16f65203aa37e7c10ecfb22384c4c01e70ebbd30a13c0d6944ffc6e59e"
      when :arm
        url "https://github.com/BurntSushi/ripgrep/releases/download/0.8.0/ripgrep-0.8.0-arm-unknown-linux-gnueabihf.tar.gz"
        version "0.8.0"
        sha256 "1faaaaa6f4583d751e10333e0c706eac77f8ab8ee0605d85d25c09785c5d97bc"
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

  def install
    odie "Platform not supported." if active_spec.url == "file://#{__FILE__}"

    bin.install "rg"
    install_doc

    bash_completion.install "complete/rg.bash"
    fish_completion.install "complete/rg.fish"
    zsh_completion.install "complete/_rg"
  end

  test do
    system bin/"rg", "--version"
  end
end
