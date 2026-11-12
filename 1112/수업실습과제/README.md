# Average of Five Numbers (Windows x64)

A small x86-64 assembly program written in NASM. It reads five integers and prints their average to two decimal places.

## Requirements

- 64-bit Windows
- NASM
- MinGW-w64 GCC (`gcc`)

Make sure `nasm` and `gcc` are available in your terminal's `PATH`.

## Build

Open a terminal in the folder containing `avg.asm` and run:

```bash
nasm -f win64 avg.asm -o avg.obj
gcc avg.obj -o avg.exe
```

## Run

In Command Prompt or PowerShell:

```powershell
.\avg.exe
```

Enter five integers separated by spaces or line breaks, then press Enter.

## Example

```text
1 2 3 4 5
Average: 3.00
```

The program assumes that five valid integers are entered.
