{
  config,
  lib,
  ...
}:
let
  leader = (config.globals or { }).mapleader or " ";
  mkPrefix = prefix: attrs: lib.nixvim.applyPrefixToAttrs prefix attrs;
in
{
  _module.args = {
    inherit mkPrefix;
    mkPrefixLeader = suffix: attrs: mkPrefix "${leader}${suffix}" attrs;
  };
}
