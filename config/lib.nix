{
  config,
  inputs,
  lib,
  ...
}:
let
  leader = (config.globals or { }).mapleader or " ";
  mkLuaTextFile = name: builtins.readFile (inputs.self + "/config/lua/${name}.lua");
  mkLuaFile = name: lib.nixvim.mkRaw (mkLuaTextFile name);
  mkPrefix = prefix: lib.mapAttrs' (name: value: lib.nameValuePair "${prefix}${name}" value);
in
{
  _module.args = {
    inherit mkLuaFile mkLuaTextFile mkPrefix;
    mkPrefixLeader = suffix: attrs: mkPrefix "${leader}${suffix}" attrs;
  };
}
