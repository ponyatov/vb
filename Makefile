# tool
DC = dmd

# src
D += $(wildcard src/*.d)

# all
.PHONY: all
all:
	dub run --compiler=$(DC)

# format
.PHONY: format
format: tmp/format_d
tmp/format_d: $(D)
	dub run dfmt -- -i $? && touch $@
