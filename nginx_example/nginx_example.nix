{ pkgs, config, ...} : {

  i18n.consoleKeyMap = "us";

  services.nginx = {
    enable = true;
    # Serves a single domain, with some files
    # located in ./public directory
    virtualHosts."_".root = ./public;
  };

  networking = {
    firewall.allowedTCPPorts = [ 80 443 ];
    hostName = "hello";
    # lets encrypt is very easy to configure ..
  };

  users = {
    # Using an empty initial hashed password just
    # for DEMO purposes!
    extraUsers.root.initialHashedPassword = "";
    # The list of users, IS the list of users, if you make
    # a change of users, they are actually gone. This is not
    # usually not the case with chef and pet.
    mutableUsers = false;

    # Message of the day:
    motd = with config; ''
      Welcome to ${networking.hostName}
      - This machine is managed by NixOS
      - All changes are futile

      OS: NixOS ${system.nixos.release} (${system.nixos.codeName})
      Version: ${system.nixos.version}
      Kernel: ${boot.kernelPackages.kernel.version}
    '';
  };

  environment.systemPackages = with pkgs; [ neovim ];
}
