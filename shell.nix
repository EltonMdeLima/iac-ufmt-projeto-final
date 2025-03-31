{ pkgs ? import <nixpkgs> { config.allowUnfree = true; } }:

let
  isWSL = builtins.getEnv "WSL_INTEROP" != null;
in
pkgs.mkShell {
  name = "developer-iac-environment";

  buildInputs = [
    pkgs.git
    pkgs.gitflow
    pkgs.zsh
    pkgs.curl
    pkgs.micro
    pkgs.bat
    pkgs.docker
    pkgs.docker-compose
    pkgs.terraform
    pkgs.ansible
    pkgs.redli
  ] ++ (if !isWSL then [ pkgs.vscode ] else []);

  shellHook = ''
    echo ""
    echo "🚀 Ambiente Nix DEVELOPER pronto!"
    echo "🔍 Testando ferramentas essenciais..."

    echo -n "🐳 Docker: "; docker --version || echo "❌"
    echo -n "🐙 Docker Compose: "; docker-compose --version || echo "❌"
    echo -n "📦 Terraform: "; terraform --version | head -n 1 || echo "❌"
    echo -n "🔧 Ansible: "; ansible --version | head -n 1 || echo "❌"
    echo -n "🔁 Git: "; git --version || echo "❌"

    if type code >/dev/null 2>&1; then
      echo "💻 Instalando extensões VS Code..."
      code --install-extension ms-azuretools.vscode-docker --force
      code --install-extension hashicorp.terraform --force
      code --install-extension redhat.ansible --force
      code --install-extension mtxr.sqltools --force
      code --install-extension mtxr.sqltools-driver-pg --force
      code --install-extension jnoortheen.nix-ide --force
      code --install-extension streetsidesoftware.code-spell-checker-portuguese-brazilian --force
    fi

    echo ""
    echo "✅ Ambiente completo para execução do projeto DEVELOPER!"
    echo "💡 Use 'code .' para abrir no VS Code com extensões recomendadas."
    echo ""
  '';
}
