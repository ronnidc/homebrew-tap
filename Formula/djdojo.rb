class Djdojo < Formula
  desc "YouTube playlist as lossless AIFF or FLAC for DJ practice"
  homepage "https://github.com/ronnidc/djdojo"
  url "https://github.com/ronnidc/djdojo/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "c324827fdcf311c70d6eab7b4b07ccfe6e347f09bb4f7eb2b34d5bdbfd7c417b"
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
