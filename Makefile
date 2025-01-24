render:
	npx tsx src/index.ts

open:
	open -a "Arc" output.svg

.PHONY: render-and-open
render-and-open:
	npx tsx src/index.ts
	open -a "Arc" output.svg
