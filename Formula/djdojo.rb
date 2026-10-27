class Djdojo < Formula
  desc "YouTube playlist as lossless AIFF or FLAC for DJ practice"
  homepage "https://github.com/ronnidc/djdojo"
  url "https://github.com/ronnidc/djdojo/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "dbfca7f88f8fa1d534591e0db1c6fd87ac36cd9e787dc962069bede6aa355f7a"
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
