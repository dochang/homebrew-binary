class Ripgrep < Formula
  desc "ripgrep combines the usability of The Silver Searcher with the raw speed of grep."
  homepage "https://github.com/BurntSushi/ripgrep"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/BurntSushi/ripgrep/releases/download/0.9.0/ripgrep-0.9.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "2eb4443e58f95051ff76ea036ed1faf940d5a04af4e7ff5a7dbd74576b907e99"
      when :arm
        url "https://github.com/BurntSushi/ripgrep/releases/download/0.9.0/ripgrep-0.9.0-arm-unknown-linux-gnueabihf.tar.gz"
        version "0.9.0"
        sha256 "c6cf40e2766c408c5c1cebfda3d5efa2af3ce9ff89f018d30e43d36aa2337719"
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

  def install
    odie "Platform not supported." if active_spec.url == "file://#{__FILE__}"

    bin.install "rg"
    install_doc
    install_completions
  end

  test do
    system bin/"rg", "--version"
  end
end
