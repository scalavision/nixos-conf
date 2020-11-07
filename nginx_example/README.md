# Example of NixOS module system

You can build a VM to test your nixos module using this command:

```bash
nixos-rebuild -I nixos-config=$PWD/nginx_example.nix build-vm
```

To run the vm with port forwarding to the host:

```bash
QEMU_NET_OPTS=hostfwd=tcp::8080-:80 ./result/bin/run-hello-vm
```
