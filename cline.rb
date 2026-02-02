# IMPORTANT: `npm run postpublish` to update this file after publishing a new version of the package
class Cline < Formula
  desc "Autonomous coding agent CLI - capable of creating/editing files, running commands, and more"
  homepage "https://cline.bot"
  url "https://registry.npmjs.org/cline/-/cline-2.0.0.tgz" # GET from https://registry.npmjs.org/cline/latest tarball URL
  sha256 "b82b32bb18a6606032f920b9b8b3179e50ee5dc64c7ea084c09a741f01629962"
  license "Apache-2.0"

  depends_on "node@20"
  depends_on "ripgrep"

  def install
    system "npm", "install", *std_npm_args(prefix: false)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # Test that the binary exists and is executable
    assert_match version.to_s, shell_output("#{bin}/cline --version")
  end
end

