- create program.asm file and paste assembly language code in it
```bash
touch program.asm
```
```bash
nasm -f elf64 program.asm -o program.o
ld program.o -o program
./program
```
- replace `program` with your `filename`.