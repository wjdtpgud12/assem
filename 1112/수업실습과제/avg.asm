INCLUDE Irvine32.inc

.data
    prompt      BYTE "정수를 입력하세요: ", 0
    averageMsg  BYTE "평균: ", 0

    num1 SDWORD ?
    num2 SDWORD ?
    num3 SDWORD ?
    num4 SDWORD ?
    num5 SDWORD ?

    five REAL8 5.0

.code
main PROC
    ; 정수 5개 입력받기
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov num1, eax

    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov num2, eax

    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov num3, eax

    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov num4, eax

    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov num5, eax

    ; 평균 계산: FPU에 정수들을 올려 더한 후 5로 나눔
    fild DWORD PTR num1
    fild DWORD PTR num2
    faddp ST(1), ST(0)

    fild DWORD PTR num3
    faddp ST(1), ST(0)

    fild DWORD PTR num4
    faddp ST(1), ST(0)

    fild DWORD PTR num5
    faddp ST(1), ST(0)

    fdiv QWORD PTR five

    ; 평균 출력
    mov edx, OFFSET averageMsg
    call WriteString
    call WriteFloat
    call Crlf

    exit
main ENDP

END main
