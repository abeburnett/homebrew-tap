class Skillcanary < Formula
  desc "Check AI skills and plugins before your agent reads them"
  homepage "https://skillcanary.com"
  url "https://github.com/abeburnett/canary/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "c4a4916c8802847f00cca59b54ccdc7f0d82b93fd513985c7fc6c07c45c8d133"
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
