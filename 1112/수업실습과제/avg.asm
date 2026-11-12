; 5개의 정수를 입력받아 정수 평균(소수점 이하 버림)을 출력하는 32-bit MASM 프로그램
; 입력은 한 줄에 하나씩, -1,000,000 ~ 1,000,000 범위의 정수로 입력합니다.
; 외부 라이브러리(Irvine32 등) 없이 Windows Console API를 사용합니다.

.386
.model flat
option casemap:none

GetStdHandle PROTO STDCALL :DWORD
ReadConsoleA PROTO STDCALL :DWORD, :PTR BYTE, :DWORD, :PTR DWORD, :DWORD
WriteConsoleA PROTO STDCALL :DWORD, :PTR BYTE, :DWORD, :PTR DWORD, :DWORD
ExitProcess PROTO STDCALL :DWORD

WriteInt PROTO STDCALL, value:SDWORD

.data
prompt          BYTE "Enter an integer: "
promptLen       EQU ($ - prompt)
averageLabel    BYTE 13, 10, "Integer average (truncated): "
averageLen      EQU ($ - averageLabel)
newLine         BYTE 13, 10
newLineLen      EQU ($ - newLine)

hInput          DWORD ?
hOutput         DWORD ?
charsRead       DWORD ?
charsWritten    DWORD ?
inputCount      DWORD ?
inputBuffer     BYTE 128 DUP(0)
sum             SDWORD 0
numberBuffer    BYTE 16 DUP(0)

.code
main PROC
    ; 표준 콘솔 입력/출력 핸들
    INVOKE GetStdHandle, -10       ; STD_INPUT_HANDLE
    mov hInput, eax
    INVOKE GetStdHandle, -11       ; STD_OUTPUT_HANDLE
    mov hOutput, eax

    mov DWORD PTR [sum], 0
    mov DWORD PTR [charsWritten], 0

    ; 다섯 번 입력받기
    mov DWORD PTR [inputCount], 0

InputLoop:
    INVOKE WriteConsoleA, hOutput, ADDR prompt, promptLen, ADDR charsWritten, 0
    INVOKE ReadConsoleA, hInput, ADDR inputBuffer, SIZEOF inputBuffer, ADDR charsRead, 0

    ; 입력 문자열에서 부호와 숫자를 읽어 EAX에 정수로 구성
    lea esi, inputBuffer
    xor eax, eax
    xor edi, edi                   ; 부호 플래그: 0=양수, 1=음수

SkipLeadingSpaces:
    movzx ebx, BYTE PTR [esi]
    cmp bl, ' '
    je  SkipChar
    cmp bl, 9                      ; 탭
    je  SkipChar
    jmp CheckSign

SkipChar:
    inc esi
    jmp SkipLeadingSpaces

CheckSign:
    cmp BYTE PTR [esi], '-'
    jne CheckPlus
    mov edi, 1
    inc esi
    jmp ParseDigits

CheckPlus:
    cmp BYTE PTR [esi], '+'
    jne ParseDigits
    inc esi

ParseDigits:
    movzx ebx, BYTE PTR [esi]
    cmp bl, '0'
    jb  Parsed
    cmp bl, '9'
    ja  Parsed
    imul eax, eax, 10
    sub ebx, '0'
    add eax, ebx
    inc esi
    jmp ParseDigits

Parsed:
    test edi, edi
    jz  AddToSum
    neg eax

AddToSum:
    add DWORD PTR [sum], eax
    inc DWORD PTR [inputCount]
    cmp DWORD PTR [inputCount], 5
    jl  InputLoop

    ; signed sum / 5. IDIV는 0 방향으로 소수 부분을 버립니다.
    INVOKE WriteConsoleA, hOutput, ADDR averageLabel, averageLen, ADDR charsWritten, 0
    mov eax, DWORD PTR [sum]
    cdq
    mov ebx, 5
    idiv ebx
    INVOKE WriteInt, eax

    INVOKE WriteConsoleA, hOutput, ADDR newLine, newLineLen, ADDR charsWritten, 0
    INVOKE ExitProcess, 0
main ENDP

; EAX로 전달한 32-bit signed 정수를 콘솔에 출력
WriteInt PROC STDCALL USES ebx esi edi, value:SDWORD
    mov eax, value
    lea esi, numberBuffer[15]
    mov BYTE PTR [esi], 0
    dec esi

    xor edi, edi                   ; 음수 여부
    test eax, eax
    jns ConvertDigits
    mov edi, 1
    neg eax                        ; README에 기재된 입력 범위에서는 안전

ConvertDigits:
    mov ebx, 10
ConvertLoop:
    xor edx, edx
    div ebx
    add dl, '0'
    mov BYTE PTR [esi], dl
    dec esi
    test eax, eax
    jnz ConvertLoop

    test edi, edi
    jz  WriteNumber
    mov BYTE PTR [esi], '-'
    dec esi

WriteNumber:
    inc esi
    lea edx, numberBuffer[15]
    sub edx, esi                   ; 출력 길이(널 문자 제외)
    INVOKE WriteConsoleA, hOutput, esi, edx, ADDR charsWritten, 0
    ret
WriteInt ENDP

END main
