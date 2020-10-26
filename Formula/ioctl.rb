class Ioctl < Formula
  desc "Command-line interface for interacting with the IoTeX blockchain"
  homepage "https://docs.iotex.io/developer/get-started/ioctl-install.html"
  url "https://github.com/iotexproject/iotex-core/archive/v1.1.2.zip"
  sha256 "2c33c38481292aad71670a060445cf0d658ac5b22609cc8131f76caa346cdfbb"
  license "Apache-2.0"

  bottle do
    cellar :any_skip_relocation
    sha256 "853cecf5618a240600402dfd7a96a7e6bea5a9accadbd29ae8d5ce2091b073b1" => :catalina
    sha256 "16aff3f50f0a48870951cefd48ff9956ee0dd1abc5f80abde24db398ce501f06" => :mojave
    sha256 "26165d126a282494e885d29608f1e231ca1ee669e2bac0283e02013a8b036446" => :high_sierra
  end

  depends_on "go" => :build

  def install
    system "make", "ioctl"
    bin.install "bin/ioctl"
  end

  test do
    output = shell_output "#{bin}/ioctl config set endpoint api.iotex.one:443"
    assert_match "Endpoint is set to api.iotex.one:443", output
  end
end
