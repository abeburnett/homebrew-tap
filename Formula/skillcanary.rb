class Skillcanary < Formula
  desc "Check AI skills and plugins before your agent reads them"
  homepage "https://skillcanary.com"
  url "https://github.com/abeburnett/canary/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "57f28dc10d97c3c66bdc7fdfa2a7c8071757eaf58c83cefaa1e1cc35a7ecdd45"
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
      Run `canary setup` to choose a protection level.
    EOS
  end

  test do
    assert_match "usage: canary", shell_output("#{bin}/canary --help")
  end
end
