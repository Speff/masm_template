TARGET  = helloASM

ASM_CC  = C:\\masm32\\bin\\ml.exe
LINK_CC = C:\\masm32\\bin\\PoLink.exe
SS      = CONSOLE
AFLAGS  = 

ODIR    = obj

_OBJ    = main.obj
OBJ     = $(patsubst %,$(ODIR)\\%,$(_OBJ))


$(ODIR)\\%.obj: %.asm 
	@IF NOT EXIST "obj\\" mkdir obj
	$(ASM_CC) /Fo $@ /c /coff /nologo $(AFLAGS) "$<"

$(TARGET): $(OBJ)
	$(LINK_CC) /SUBSYSTEM:$(SS) $(OBJ) /OUT:$@.exe

.PHONY: clean

clean: 
	@IF EXIST "obj\\" rmdir /S /Q obj
