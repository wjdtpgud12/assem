# 5개 정수의 평균 — 32-bit MASM

Visual Studio의 **32-bit MASM**으로 빌드하는 콘솔 프로그램입니다. 정수 5개를 한 줄에 하나씩 입력받고, 평균을 정수로 출력합니다. 평균의 소수 부분은 **0 방향으로 버립니다**(`IDIV` 동작). 예를 들어 합이 151이면 결과는 30입니다.

- 외부 교육용 라이브러리(Irvine32 등) 없이 Windows Console API 사용
- 입력 범위: 각 정수 `-1,000,000` ~ `1,000,000`
- 입력은 유효한 정수라고 가정합니다.

## 파일

- `average.asm` — MASM 소스 코드

## Visual Studio에서 빌드하기

1. Visual Studio Installer에서 **Desktop development with C++** 워크로드를 설치합니다.
2. 새 프로젝트에서 **Empty Project (C++)**를 만들고, 플랫폼을 **Win32/x86**으로 선택합니다. (x64가 아닙니다.)
3. 프로젝트를 우클릭 → **Build Dependencies → Build Customizations...** → `masm` 체크.
4. `average.asm`을 프로젝트에 추가합니다.
5. `average.asm` 속성에서 **Item Type**이 `Microsoft Macro Assembler`인지 확인합니다.
6. 프로젝트 속성에서 다음을 설정합니다. `All Configurations`와 `Win32` 설정에 적용하세요.
   - **Linker → System → SubSystem**: `Console (/SUBSYSTEM:CONSOLE)`
   - **Linker → Advanced → Entry Point**: `main`
   - **Linker → Input → Additional Dependencies**: `kernel32.lib;%(AdditionalDependencies)`
7. 빌드 후 실행합니다. Visual Studio 디버깅 실행은 **Ctrl+F5**를 사용하면 입력/출력 창이 바로 닫히지 않습니다.

> 이 코드는 32-bit MASM(`ml.exe`)용입니다. x64 구성(`ml64.exe`)으로 빌드하면 `.model flat` 등 x86 문법 때문에 맞지 않습니다.

## 실행 결과 화면 예시

아래는 입력 예시를 보여주는 **텍스트 콘솔 화면**입니다. (실제 Windows 스크린샷이 아니라 예상 실행 출력의 재현입니다.)

```text
Enter an integer: 10
Enter an integer: 20
Enter an integer: 30
Enter an integer: 40
Enter an integer: 50

Integer average (truncated): 30
```

음수와 나머지가 있는 경우도 정수 나눗셈 규칙을 따릅니다. 예: `-7, 0, 0, 0, 0` 입력 시 합은 -7이고 출력 평균은 `-1`입니다.

## 계산 방식

1. 각 입력 문자열의 부호와 숫자를 읽어 32-bit signed 정수로 변환합니다.
2. 다섯 정수를 합산합니다.
3. 합을 5로 signed 나눗셈(`IDIV`)하여 몫을 출력합니다.

Visual Studio의 MASM 및 32-bit `INVOKE` / `PROC` 문법은 Microsoft Learn의 MASM 문서를 참고했습니다:
- [MASM `.MODEL`](https://learn.microsoft.com/en-us/cpp/assembler/masm/dot-model?view=msvc-170)
- [MASM `INVOKE`](https://learn.microsoft.com/en-us/cpp/assembler/masm/invoke?view=msvc-170)
