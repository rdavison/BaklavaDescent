# OxCaml Bridge (Phase 1)

This is the first incremental bridge for function-by-function porting from C to OxCaml.

## Ported functions

- `cd_i2f`
- `cd_f2i`
- `cd_fixmul`
- `cd_fixdiv`

These mirror logic from `fix/fix.h`.

## Build bridge object

```bash
./scripts/ox/build_bridge.sh
```

Build artifact:

- `ox/build/math_bridge_complete.o`

## Run smoke test (C calls Ox)

```bash
./scripts/ox/run_smoke.sh
```

This compiles and runs `ox/smoke_test.cpp`, comparing C `fixmul/fixdiv` with Ox callbacks.

## C-side usage

At startup:

```c
cd_ox_init_runtime(argv[0]);
```

Then call wrappers:

```c
fix out = cd_ox_fixmul(a, b);
```
