class Harnesstap < Formula
  desc "Agent harness configuration toolkit for Claude Code, Codex, Cursor and more"
  homepage "https://harnesstap.com"
  url "https://registry.npmjs.org/harnesstap/-/harnesstap-1.6.2.tgz"
  sha256 "1bd6fe095da71ad0dad60954f612315d9d08efbb9711d3bef796ea1090ab7405"
  license "Apache-2.0"

  livecheck do
    url :stable
  end

  depends_on "node@24"

  def install
    node = formula_opt_bin("node@24")
    ENV.prepend_path "PATH", node
    system node/"npm", "install", *std_npm_args(ignore_scripts: false)
    env = { PATH: "#{node}:$PATH", HARNESSTAP_INSTALL_METHOD: "brew" }
    %w[harnesstap ht].each do |cmd|
      (bin/cmd).write_env_script libexec/"bin"/cmd, env
    end
  end

  test do
    ENV["HARNESSTAP_TELEMETRY"] = "0"
    ENV["HARNESSTAP_SKIP_UPDATE_CHECK"] = "1"
    assert_match version.to_s, shell_output("#{bin}/harnesstap --version")
    # `status` opens the SQLite library, so this proves better-sqlite3 built for this Node.
    assert_match "PROJECT", shell_output("#{bin}/ht status")
    assert_path_exists testpath/".harnesstap/harnesstap.db"
  end
end
