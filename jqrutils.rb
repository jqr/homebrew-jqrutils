class Jqrutils < Formula
  desc "Small Unix command-line tools"
  homepage "https://github.com/jqr/jqrutils"
  url "https://github.com/jqr/jqrutils/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "42c446ec895150955b46187e75667f42350c2500002a42b00f1a71a8210821ed"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/quiet"
    bin.install "target/release/errfail"
    bin.install "target/release/prefix"
  end

  test do
    assert_match "hello", shell_output("#{bin}/errfail echo hello")
    shell_output("#{bin}/errfail sh -c 'echo warn >&2'", 2)
    assert_equal "", shell_output("#{bin}/quiet echo hello")
    output = shell_output("#{bin}/quiet sh -c 'echo fail; exit 1'", 1)
    assert_match "fail", output
    output = shell_output("#{bin}/prefix '[test]' echo hello")
    assert_match "[test] hello", output
  end
end
