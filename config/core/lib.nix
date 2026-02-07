{
  config,
  inputs,
  lib,
  ...
}:
let
  leader = (config.globals or { }).mapleader or " ";
  mkLuaTextFile = path: builtins.readFile (inputs.self + "/config/${path}.lua");
  mkLuaFile = path: lib.nixvim.mkRaw (mkLuaTextFile path);
  mkPrefix = prefix: lib.mapAttrs' (name: value: lib.nameValuePair "${prefix}${name}" value);
in
{
  _module.args = {
    inherit
      mkLuaFile
      mkLuaTextFile
      mkPrefix
      ;
    mkPrefixLeader = suffix: attrs: mkPrefix "${leader}${suffix}" attrs;
  };
}
