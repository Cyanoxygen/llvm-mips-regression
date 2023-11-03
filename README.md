# LLVM regression on MIPS

This is a minimal PoC to reproduce the regression for MIPS found in recent LLVM revisions.

Testing
--------

This PoC has been tested positive with the following LLVM revisions/forks:

| LLVM Version | Source | Positive? |
| ------------ | ------ | --------- |
| LLVM 16.0.6  | https://github.com/llvm/llvm-project/releases/tag/llvmorg-16.0.6 | No |
| LLVM 17.0.2 (Rust) | https://github.com/rust-lang/llvm-project/tree/rustc/17.0-2023-09-19 | Yes |
| LLVM 17.0.4 | https://github.com/llvm/llvm-project/releases/tag/llvmorg-17.0.4 | Yes |
| LLVM 18 (Git master) | https://github.com/llvm/llvm-project/tree/main | Yes |

Behavior
--------

The sample IR tries to perform a shift-left operation to a `__uint128`, with variable width. In the example C code, the shift width is effectively a constant 51.  
We prevent it from being optimized out with `-O0`.

The resulting code failed to produce the correct result, as the bits shifted out of lower 64 bits are not saved and not added to the upper 64 bits after shifting.

The value being shifted is `0x12481248124812481248124812481248u128`. The expected result is `0x92409240924092409240000000000000`, however the value is malformed, which is `92400000000000009240000000000000`.
