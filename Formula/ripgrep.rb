class Ripgrep < Formula
  desc "ripgrep combines the usability of The Silver Searcher with the raw speed of grep."
  homepage "https://github.com/BurntSushi/ripgrep"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep-0.8.1-x86_64-unknown-linux-musl.tar.gz"
        sha256 "08b1aa1440a23a88c94cff41a860340ecf38e9108817aff30ff778c00c63eb76"
      when :arm
        url "https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep-0.8.1-arm-unknown-linux-gnueabihf.tar.gz"
        version "0.8.1"
        sha256 "211414cdfed32b27479a14dd21e49d11fa02a24fb396051ef53af67b9141b3cd"
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
