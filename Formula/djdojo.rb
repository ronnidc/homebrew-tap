class Djdojo < Formula
  desc "YouTube playlist as lossless AIFF or FLAC for DJ practice"
  homepage "https://github.com/ronnidc/djdojo"
  url "https://github.com/ronnidc/djdojo/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "3db65a15918602352a2c89772e3044856591568b123c5d910889ce78fe137ead"
  license "MIT"

  depends_on "ffmpeg"
  depends_on :macos
  depends_on "yt-dlp"

  def install
    # djdojo looks for djdojo.conf next to its own resolved path, so both go in libexec
    # and bin gets a symlink
    libexec.install "djdojo", "djdojo.conf"
    bin.install_symlink libexec/"djdojo"
  end

  test do
    assert_match "Usage: djdojo", shell_output("#{bin}/djdojo --help")
    assert_match version.to_s, shell_output("#{bin}/djdojo --version")
  end
end
