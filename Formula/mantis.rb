class Mantis < Formula
  desc "Unified security control for macOS network tools"
  homepage "https://github.com/gn9nfg2yzj-cyber/mantis"
  url "https://github.com/gn9nfg2yzj-cyber/mantis/archive/v2.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"
  version "2.1.0"

  depends_on :macos

  def install
    bin.install "bin/mantis"
    bin.install "bin/mantis-unified-coordinator.sh"
    bin.install "bin/mantis-proxy-setup.sh"
    bin.install "bin/mantis-hosts-update.sh"
    (lib/"mantis").install "lib/mantis-lib.sh"
  end

  def caveats
    <<~EOS
      Mantis requires these optional tools for full functionality:
        - warp-cli (Cloudflare WARP)
        - jq (JSON processing)
        - Proxyman.app
        - TinyShield.app
        - Stratoshark

      Run 'mantis status' to check your security posture.
      Run 'mantis' for interactive mode.
    EOS
  end

  test do
    assert_match "Mantis Security Framework", shell_output("#{bin}/mantis --version")
  end
end
