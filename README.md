# An Even Easier Introduction to CUDA

## Nvidia GeForece GTX 750 Ti

|  | Name | Invocations | Avg. Duration(ns) | Avg. Duration(ms) | Registers/Thread | Static Shared Memory | Avg. Dynamic Shared Memory |
|:---------------------------------------------:|:--------------------------:|:-----------:|:-----------------:|:-----------------:|:----------------:|:--------------------:|:--------------------------:|
| 1 block_size 1 num_blocks | "add(int, float*, float*)" | 1 | 198755521 | 198.755521 | 13 | 0 | 0 |
| 256 block_size 1 num_blocks | "add(int, float*, float*)" | 1 | 1501635 | 1.501635 | 8 | 0 | 0 |
| 256 block_size (1<<20 + 255) / 256 num_blocks | "add(int, float*, float*)" | 1 | 160131 | 0.160131 | 10 | 0 | 0 |
