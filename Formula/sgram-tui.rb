class SgramTui < Formula
  desc "Terminal spectrogram viewer (WAV/mic) with palettes and exports"
  homepage "https://github.com/arian-shamaei/sgram-tui"
  url "https://github.com/arian-shamaei/sgram-tui/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "728066b14bbfad26a4b430e9560c0d9e16d6f1d7031865d220bf4cd9209f4bb1"
  license "MIT"

  depends_on "rust" => :build
  on_linux do
    depends_on "alsa-lib"
  end

  def install
    system "cargo", "install", *std_cargo_args, "--features=mic"
  end

  test do
    assert_match "Terminal spectrogram viewer", shell_output("#{bin}/sgram-tui --help")
  end
end
