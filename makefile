TARGET  = helloASM

ASM_CC  = /c/masm32/bin/ml.exe
LINK_CC = /c/masm32/bin/PoLink.exe
SS      = CONSOLE
AFLAGS  = 
#AFLAGS = //Zi //Zi //Zf /F1

ODIR    = obj

_OBJ    = main.o
OBJ     = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.asm 
	@if [ -d "obj" ]; then :; else mkdir "obj"; fi
	$(ASM_CC) //Fo $@ //c //coff //nologo $(AFLAGS) "$<"

$(TARGET): $(OBJ)
	$(LINK_CC) //SUBSYSTEM:$(SS) $(OBJ) //OUT:$@.exe

.PHONY: clean

clean: 
	@if [ -d "obj" ]; then rm -rf "obj"; else :; fi
