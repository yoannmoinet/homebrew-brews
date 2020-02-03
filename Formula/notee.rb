require "language/node"

class Notee < Formula
  desc "Get a notification after a long command."
  homepage "https://github.com/yoannmoinet/notee"
  url "https://github.com/yoannmoinet/notee/archive/v1.1.1.tar.gz"
  sha256 "92b0a031c2192d0aca898cfd06291f234179df73c8596fc484d455db5359f93c"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/n"]
  end

  test do
    output = shell_output("#{bin}/n echo 'hello'", 0)
    assert_match "hello", output
  end
end
