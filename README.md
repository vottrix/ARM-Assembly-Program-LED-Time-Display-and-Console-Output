# ARM Assembly Exercises

This repository contains a collection of ARM assembly programs written for weekly exercises in the CSCN71010 course. Each file demonstrates a specific concept in low-level programming, including memory access, arithmetic operations, branching, system calls, and function implementation.

## 📁 File Descriptions

| Filename                      | Description |
|------------------------------|-------------|
| `memory_store_and_load.s`         | Stores the number 13 in memory and loads it back into a register. Demonstrates basic use of `MOV`, `STR`, and `LDR`. |
| `workaround_mov_limitations.s`   | Loads large constants into registers using `.data` section since they can't fit in a single `MOV` instruction. |
| `strb_strh_memory_write.s`       | Writes a byte and halfword to memory, then reads a full word. Uses `STRB`, `STRH`, and `LDR`. |
| `arithmetic_sum_multiply.s`      | Adds 2398 and 7341, multiplies the result by 15, and stores the final value in `r6`. |
| `expression_evaluation_subtract.s` | Evaluates the expression `x - (y + z) * w` and stores the result in `r10`. |
| `64bit_math_add_multiply.s`      | Performs 64-bit addition and multiplication using `UMULL`, `ADDS`, and `ADC`. |
| `signed_division.s`              | Divides 12 by -3 using the `SDIV` instruction and stores the result in `r2`. |
| `bit_check_and_extract.s`        | Checks the 5th least significant bit of a number and stores 1 in `r4` if it's set. |
| `compare_and_branch_example.s`   | Compares a number to 12 and stores 1 or 2 in `r7` based on the result. |
| `age_based_multiplier.s`         | Multiplies a person’s height by a factor (3, 4, or 5) based on their age category. |
| `sum_numbers_1_to_100_loop.s`    | Adds numbers from 1 to 100 using a loop and stores the result in `r1`. |
| `collatz_sequence.s`             | Implements the Collatz sequence: multiply by 3 and add 1 if odd, or divide by 2 if even, until reaching 1. |
| `function_evaluate_expression.s` | Function that evaluates `x² - 4xy + 2y² + 3`, with result returned in `r0`. |
| `function_sum_1_to_n.s`          | Adds numbers from 1 to `n` using a loop inside a function, result stored in `r0`. |
| `recursive_factorial.s`          | Recursively calculates factorial of `n`, using stack operations to store state. |
| `ARM-Assembly-Program.s`         | Demonstrates I/O with LEDs and seven-segment displays, system calls, and number formatting. |

---

## 🛠 Usage

Each `.s` file can be assembled and linked using an ARM-compatible toolchain like `arm-none-eabi`:

```bash
as -o file.o file.s
ld -o file file.o
./file
```

Or tested via QEMU, an emulator for ARM platforms.

---

## 📚 License

MIT License. For educational use.
