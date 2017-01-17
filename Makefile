.PHONY: test

ML_FILES := $(wildcard *.ml)
MLL_FILES := $(wildcard *.mll)
MLY_FILES := $(wildcard *.mly)

test_things.native: $(ML_FILES) $(MLL_FILES) $(MLY_FILES)
	ocamlbuild -use-menhir -tag thread -use-ocamlfind -pkg ounit -pkg core test_things.native

test: test_things.native
	./test_things.native
