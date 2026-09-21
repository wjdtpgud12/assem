
Motherboard
개념: 컴퓨터의 뼈대이자 혈관 역할을 하는 가장 큰 주 회로 기판(메인보드)입니다.
역할: CPU, RAM, 그래픽카드, 저장장치 등 모든 하드웨어 부품이 장착되는 바탕이 됩니다. 부품들 간에 데이터를 주고받을 수 있는 통신 경로를 제공하고, 파워서플라이로부터 받은 전력을 각 부품에 알맞게 분배.

CPU & GPU
CPU: 컴퓨터의 두뇌에 해당한다.
역할: 운영체제와 소프트웨어에서 내리는 모든 명령을 해석하고 연산하며, 시스템 전반을 통제하고 다른 부품들에게 작업 지시
GPU: 시각적 데이터 처리에 특화된 전용 프로세서
역할: 모니터에 출력될 픽셀들을 계산하여 이미지, 영상, 복잡한 3D 그래픽을 빠르고 매끄럽게 화면에 렌더링하는 역할

Main Memory & SSD
주 기억장치 (RAM): 컴퓨터가 일하는 '작업대' 역할을 하는 휘발성 메모리입니다.
역할: CPU가 당장 처리해야 할 데이터나 현재 실행 중인 프로그램들을 임시로 올려두고 빠르게 꺼내 쓰는 공간입니다. 작업대가 넓을수록(용량이 클수록) 여러 프로그램을 동시에 띄워놓고 작업하기 수월합니다. 전원을 끄면 데이터가 사라집니다.
SSD (보조 기억장치): 데이터를 영구적으로 보관
역할: 윈도우 같은 운영체제(OS), 각종 프로그램, 사진, 문서 등의 파일을 저장합니다. 과거의 하드디스크(HDD)를 대체하며 전자적으로 데이터를 읽고 쓰기 때문에 부팅 및 프로그램 로딩 속도를 비약적으로 높여줍니다.

Keyboard, Mouse, Monitor
키보드 & 마우스 (입력 장치): 사용자의 의도를 컴퓨터에 전달하는 도구입니다.
역할: 텍스트를 입력하거나(키보드) 화면의 커서를 조작하여(마우스) 시스템에 명령을 내리고 소프트웨어를 제어
모니터 (출력 장치): 컴퓨터의 작업 결과를 시각화하는 디스플레이 기기입니다.
역할: GPU가 연산한 그래픽 데이터를 사용자가 눈으로 확인할 수 있도록 화면에 텍스트, 이미지, 영상 형태로 띄워줍니다.

PC Building
개념: 규격과 호환성이 맞는 개별 하드웨어 부품들을 구매하여 하나의 케이스 안에 설치하고 연결하는 물리적인 과정
역할: 단순히 부품을 끼우는 것을 넘어, 각 부품에 전원 케이블과 데이터 케이블을 올바르게 연결하고, 시스템 내부의 열이 잘 빠져나가도록 쿨러를 배치하고 선을 정리하여 하나의 온전한 컴퓨터 시스템을 완성

1. In 32-bit mode, aside from the stack pointer (ESP), what other register points to variables on
the stack?
정답: EBP (베이스 포인터)

2. Name at least four CPU status flags.
정답: Carry(CF), Zero(ZF), Sign(SF), Overflow(OF), Parity(PF), Auxiliary Carry(AF) 중 4개.

3. Which flag is set when the result of an unsigned arithmetic operation is too large to fit into
the destination?
정답: Carry 플래그 (CF)

4. Which flag is set when the result of a signed arithmetic operation is either too large or too
small to fit into the destination?
정답: Overflow 플래그 (OF)

5. (True/False): When a register operand size is 32 bits and the REX prefix is used, the R8D
register is available for programs to use.
정답: True

6. Which flag is set when an arithmetic or logical operation generates a negative result?
정답: Sign 플래그

7. Which part of the CPU performs floating-point arithmetic?
정답: FPU

8. On a 32-bit processor, how many bits are contained in each floating-point data register?
정답: 80비트

9. (True/False): The x86-64 instruction set is backward-compatible with the x86 instruction set
정답: True

10. (True/False): In current 64-bit chip implementations, all 64 bits are used for addressing.
정답: False

11. (True/False): The Itanium instruction set is completely different from the x86 instruction set.
정답: True

12. (True/False): Static RAM is usually less expensive than dynamic RAM.
정답: False

13. (True/False): The 64-bit RDI register is available when the REX prefix is used.
정답: False

14. (True/False): In native 64-bit mode, you can use 16-bit real mode, but not the virtual-8086
mode.
정답: False

15. (True/False): The x86-64 processors have 4 more general-purpose registers than the x86
processors.
정답: False

16. (True/False): The 64-bit version of Microsoft Windows does not support virtual-8086 mode.
정답: True

17. (True/False): DRAM can only be erased using ultraviolet light.
정답: False

18. (True/False): In 64-bit mode, you can use up to eight floating-point registers.
정답: False

19. (True/False): A bus is a plastic cable that is attached to the motherboard at both ends, but
does not sit directly on the motherboard.
정답: False

20. (True/False): CMOS RAM is the same as static RAM, meaning that it holds its value without any extra power or refresh cycles.
정답: False

21. (True/False): PCI connectors are used for graphics cards and sound cards.
정답: True

22. (True/False): The 8259A is a controller that handles external interrupts from hardware
devices.
정답: True

23. (True/False): The acronym PCI stands for programmable component interface.
정답: False

24. (True/False): VRAM stands for virtual random access memory.
정답: False

25. At which level(s) can an assembly language program manipulate input/output?
정답: 하드웨어 수준(포트 직접 제어), BIOS 수준, 운영체제(OS API) 수준.

26. Why do game programs often send their sound output directly to the sound card’s hardware
ports?
정답: 운영체제의 입출력 루틴을 거치면서 발생하는 지연(오버헤드)을 피하고 실행 속도(퍼포먼스)를 극대화하기 위해서입니다.
