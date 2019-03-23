class ResticServer < Formula
  desc "restic's REST backend server"
  homepage "https://github.com/restic/rest-server"

  stable do
    if OS.linux?
      case Hardware::CPU.arch
      when :x86_64
        url "https://github.com/restic/rest-server/releases/download/v0.9.7/rest-server-0.9.7-linux-amd64.gz"
        version "0.9.7"
        sha256 "390b3a396f1c3ad67f9cd8ed6ae2d3c10f7c7e3a8213046009d3a905e1ee7da6"
      when :arm
        url "https://github.com/restic/rest-server/releases/download/v0.9.7/rest-server-0.9.7-linux-arm.gz"
        version "0.9.7"
        sha256 "b7e402852b1de7fc678fefb9e494314007c7deddec587bdb78aeba597d3219a2"
      end
    end
  end

  def install
    uri = URI.parse(active_spec.url)
    basename = File.basename(uri.path, ".gz")

    bin.install basename => "restic-server"
  end

  test do
    system "#{bin}/restic-server", "--help"
  end
end
