{ pkgs, config, ...}: {

  services.minio = {
    enable = true;
    dataDir = "/var/lib/s3";
    listenAddress = "0.0.0.0:9000";
  };

  services.samba = {

    enable = true;

    securityType = "user";

    extraConfig = ''
      server string = data_cluster 
      netbios name = ALBION
      workgroup = LAKE
      server role = standalone server                                                                               
      interfaces = lo eno1
      bind interfaces only = yes                                                                                    
      smb ports = 445                                                                                               
      log file = /var/log/samba/smb.log
      log level = 3 passdb:5 auth:5                                                                                 
      max log size = 10000                                                                                          

      # Disabling printing
      load printers = no
      printing = bsd
      printcap name = /dev/null
      disable spoolss = yes
      
      hosts allow = localhost
      hosts deny = 0.0.0.0/0
      guest account = nobody
      map to guest = bad user

    '';

    shares = {

      test = {
        path = "/data/test";
        browseable = "yes";
        "read only" = "no";
        "force create mode" = "0644";
        "force directory mode" = "0755";
        "valid users" = "jane";
      };

    };

    environtment systemPackages = with pkgs; [ neovim curl ];
    
  };

  

  users = {


  };

}