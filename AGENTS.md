# AGENTS.md

## Development

Full gate: `nix fmt && nix flake check`

- Run gate after changes
- Nix needs files to be git-tracked to see them
- Build derivation and inspect closure

## Research & Querying

- When asked to query nixvim modules/options/behavior, search the flake-locked nixvim input source:
```sh
SRC=$(nix eval --impure --raw --expr '(builtins.getFlake (toString ./.)).inputs.nixvim.outPath')
rg -n "<pattern>" "$SRC"
# Prioritize: modules/, plugins/by-name/, lib/, tests/test-sources/
```

## Configuration policy

- Update configuration via Nix and Nix modules only, no lua unless requested. Everything is Nixified.

## Interaction and debugging

- Health checks and other diagnostics: use `:checkhealth` and related Neovim health commands in the running instance.
- Headless healthcheck: `nix run .# -- --headless "+checkhealth" +qall`
- Save output: `nix run .# -- --headless "+checkhealth" "+w! /tmp/nixvim-checkhealth.txt" +qall`
