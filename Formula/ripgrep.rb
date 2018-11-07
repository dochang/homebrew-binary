class Ripgrep < Formula
  desc "ripgrep combines the usability of The Silver Searcher with the raw speed of grep."
  homepage "https://github.com/BurntSushi/ripgrep"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "c76080aa807a339b44139885d77d15ad60ab8cdd2c2fdaf345d0985625bc0f97"
      when :arm
        url "https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-arm-unknown-linux-gnueabihf.tar.gz"
        version "0.10.0"
        sha256 "5909eb4246f8e4936a2d09d0b38c647733578f78f6aa5ace49027c1b7c4bf0e1"
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
