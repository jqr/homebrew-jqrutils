class Jqrutils < Formula
  desc "Small Unix command-line tools"
  homepage "https://github.com/jqr/jqrutils"
  url "https://github.com/jqr/jqrutils/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/quiet"
    bin.install "target/release/errfail"
  end

  test do
    assert_match "hello", shell_output("#{bin}/errfail echo hello")
    shell_output("#{bin}/errfail sh -c 'echo warn >&2'", 2)
    assert_equal "", shell_output("#{bin}/quiet echo hello")
    output = shell_output("#{bin}/quiet sh -c 'echo fail; exit 1'", 1)
    assert_match "fail", output
  end
end
