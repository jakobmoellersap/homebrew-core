require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.1.88.tgz"
  sha256 "d16f53f1cb7ae0dc60c0204f3d265b507a19a5f31b66c9111f57da416c34e9f4"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "1c8ddb18fba0510e7066ad6ec554c4f3aa287422027c33ecf6430fe2cbfde3e4"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
