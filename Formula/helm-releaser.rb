class HelmReleaser < Formula
  desc "Helm Releaser for managing helm charts in multiple environemnts"
  homepage "https://github.com/moosecanswim/helm-releaser"
  url "https://github.com/moosecanswim/helm-releaser/archive/0.0.2.tar.gz"
  sha256 "b47cce4d3d4a6442160d5037356e41e2fd23faecfc4728392683a9292df399dc"
  head "https://github.com/moosecanswim/helm-releaser.git"

  bottle :unneeded

  uses_from_macos "tar"

  def install
    prefix.install ["bin"]
  end

  def post_install
    secrets_path = "#{HOMEBREW_PREFIX}/etc/#{name}/release-secrets"
    secrets_local = "#{prefix}/release-secrets"
    values_path = "#{HOMEBREW_PREFIX}/etc/#{name}/release-values"
    values_local = "#{prefix}/release-values"

    mkdir_p secrets_path
    mkdir_p values_path

    ln_s secrets_path, secrets_local
    ln_s values_path, values_local
  end

  test do
    system bin/"helm-releaser", "-h"
  end
end