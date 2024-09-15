build:
	gleam run -m gleescript

nix-build:
    nix build

run +ARGS="":
	gleam run -- {{ ARGS }}

test +ARGS="":
	gleam test -- {{ ARGS }}
