# RISC-V OS Build Recipes

# Default recipe - show help
default:
    @just --list

# Build all components
build:
    cargo build --release --workspace

# Build specific component
build-component component:
    cargo build --release -p {{component}}

# Run tests
test:
    cargo test --workspace

# Run clippy linting
lint:
    cargo clippy --workspace -- -D warnings

# Format code
fmt:
    cargo fmt --all

# Check formatting
fmt-check:
    cargo fmt --all -- --check

# Full verification (fmt, lint, test)
verify: fmt-check lint test

# Clean build artifacts
clean:
    cargo clean

# Build bootloader
build-boot:
    cargo build --release -p riscv-bootloader

# Build kernel
build-kernel:
    cargo build --release -p riscv-kernel

# Build userspace
build-userspace:
    cargo build --release -p riscv-userspace

# Check code without building
check:
    cargo check --workspace
