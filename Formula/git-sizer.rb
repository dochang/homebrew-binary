class GitSizer < Formula
  desc "Compute various size metrics for a Git repository, flagging those that might cause problems"
  homepage "https://github.com/github/git-sizer"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/github/git-sizer/releases/download/v1.3.0/git-sizer-1.3.0-linux-amd64.zip"
        version "1.3.0"
        sha256 "d35cb3c365ead5f5ed078a65601bd150c5732f28bcb3c4872a9ee44c5b952b01"
      when :arm
        url "file://#{__FILE__}"
        version "1.3.0"
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
