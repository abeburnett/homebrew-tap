class Skillcanary < Formula
  desc "Check AI skills and plugins before your agent reads them"
  homepage "https://skillcanary.com"
  url "https://github.com/abeburnett/canary/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "c7838ff46c6a37397843a7733c05b15fb29511566b7b0cdb0f7a219f05f945d9"
  license "Apache-2.0"

  depends_on :macos

  def install
    # Run on macOS's own Python, the one Canary's hooks use, rather than
    # whichever python3 comes first on the person's PATH.
    inreplace "bin/canary", %r{\A#!/usr/bin/env python3}, "#!/usr/bin/python3"
    libexec.install "bin", "canary", "LICENSE"
    bin.install_symlink libexec/"bin/canary"
  end

  def caveats
    <<~EOS
      Next: run `canary setup` to choose a protection level.
      Step-by-step: https://skillcanary.com/start
    EOS
  end

  test do
    assert_match "usage: canary", shell_output("#{bin}/canary --help")
  end
end
