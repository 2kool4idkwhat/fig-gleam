build:
	gleam run -m gleescript

run +ARGS="":
	gleam run -- {{ ARGS }}

test +ARGS="":
	gleam test -- {{ ARGS }}
