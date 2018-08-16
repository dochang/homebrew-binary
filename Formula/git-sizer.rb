class GitSizer < Formula
  desc "Compute various size metrics for a Git repository, flagging those that might cause problems"
  homepage "https://github.com/github/git-sizer"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/github/git-sizer/releases/download/v1.2.0/git-sizer-1.2.0-linux-amd64.zip"
        version "1.2.0"
        sha256 "0baf56a3296e86e884da06a9dad98ead48d4186060abeae33f944beca784fe37"
      when :arm
        url "file://#{__FILE__}"
        version "1.2.0"
      end
    end
  end

  def install
    odie "Platform not supported." if active_spec.url == "file://#{__FILE__}"

    bin.install "git-sizer"
  end

  test do
    system bin/"git-sizer", "--version"
  end
end
