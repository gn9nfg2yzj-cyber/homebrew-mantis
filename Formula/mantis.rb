class Mantis < Formula
  desc "Unified security control for macOS network tools"
  homepage "https://github.com/gn9nfg2yzj-cyber/mantis"
  url "https://github.com/gn9nfg2yzj-cyber/mantis/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "f5727ae0b205103a9a14629511be6d68dacd6b25b0a91aa93b06e39c2310b092"
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
