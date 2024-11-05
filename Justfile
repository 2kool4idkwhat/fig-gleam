build:
	gleam run -m gleescript
	chmod +x fig

run +ARGS="":
	gleam run -- {{ ARGS }}

test +ARGS="":
	gleam test -- {{ ARGS }}
