# LLVM regression on MIPS

This is a minimal PoC to reproduce the regression for MIPS found in recent LLVM revisions.

Testing
--------

This PoC has been tested with Rust's LLVM:  
https://github.com/rust-lang/llvm-project/tree/rustc/17.0-2023-09-19/

LLVM 16 does not have this kind of regression, at least for now.

Tests with LLVM 18 (Git master) are ongoing.
