FSTAR_HOME=/home/hritcu/Projects/fstar/pub

include $(FSTAR_HOME)/ulib/ml/Makefile.include

all:
	fstar.exe --verify_all fun.fst types.fst purity.fst divergence.fst log.fst stackclient.fst

divergence:
#	$(MAKE) -C $(ULIB_ML)
	mkdir -p out
	fstar.exe $(FSTAR_DEFAULT_ARGS) --odir out --codegen OCaml divergence.fst
	$(OCAMLOPT) out/Divergence.ml -o divergence.exe
	./divergence.exe

clean:
	rm -dfr out *.exe
