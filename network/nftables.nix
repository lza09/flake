{ ... }:

let
  local = import ./local.nix;
in {
  networking.firewall.extraInputRules = ''
    ip saddr ${local.allowedProxyIp} tcp dport 25567 accept
  '';
}