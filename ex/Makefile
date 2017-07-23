
FSTAR_HOME=/home/hritcu/Projects/fstar/pub

include $(FSTAR_HOME)/ulib/ml/Makefile.include

all:
	fstar.exe --verify_all incr.fst swap.fst factorial.fst

swap:
#	$(MAKE) -C $(ULIB_ML)
	mkdir -p out
	fstar.exe $(FSTAR_DEFAULT_ARGS) --odir out --codegen OCaml swap.fst
	$(OCAMLOPT) out/Swap.ml -o swap.exe
	./swap.exe

clean:
	rm -dfr out *.exe
