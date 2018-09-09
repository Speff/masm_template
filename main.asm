.386
.model flat,stdcall
.stack 4096


includelib \masm32\lib\kernel32.lib

ExitProcess PROTO, dwExitCode:DWORD

.code
main PROC
    mov eax, 5
    add eax, 6

    call ExitProcess
main ENDP
END main
