# Homebrew formula for funcspec
# To use: brew install narbs/funcspec/funcspec
# Tap repo: https://github.com/narbs/homebrew-funcspec
#
# This formula is a template; SHA256 values are updated automatically
# by the release workflow on each new version.
class Funcspec < Formula
  desc "Command-line interface for FuncSpec"
  homepage "https://funcspec.net"
  version "0.2.19"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/narbs/funcspec-cli/releases/download/v#{version}/funcspec-v#{version}-x86_64-apple-darwin.zip"
      sha256 "4e07d85344d0ffe55e67aba8afae33320d110eb1aaed7ed83bddf9083c586c82"
    end

    on_arm do
      url "https://github.com/narbs/funcspec-cli/releases/download/v#{version}/funcspec-v#{version}-aarch64-apple-darwin.zip"
      sha256 "c420c808d40cd2797f4098c79405238073f1cd6aa4d9bf1e21f45efe7131063c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/narbs/funcspec-cli/releases/download/v#{version}/funcspec-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "14ba13d5b1063a3d809c53a60c0194efdab9f3bec547981d70c1b0cb8d11fab9"
    end

    on_arm do
      url "https://github.com/narbs/funcspec-cli/releases/download/v#{version}/funcspec-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "168769641c43dc84273b1d4f5c84bf71052dba1ac484bf94dbc542c285d4219d"
    end
  end

  def install
    bin.install "funcspec"
  end

  def caveats
    <<~EOS
      funcspec has been installed. Run `funcspec login` to authenticate with funcspec.net.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/funcspec --version")
  end
end
