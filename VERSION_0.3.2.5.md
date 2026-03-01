# wnus v0.3.2.5 Release Notes
**Release Date:** February 28, 2026  
**Executable Size:** 13.53 MB  
**Build Time:** 30.8 seconds  
**Total Commands:** 342 (no command-count change)

---

## 🎯 Release Highlights

### POSIX `sh` Loop Compatibility Fix
This patch release improves shell-script compatibility by fixing multiline `while` loop parsing/execution where `while` appears on its own line and condition commands are provided before `do`.

### Version Increment
- Runtime version constant updated to **`0.3.2.5`** in both active source trees.

---

## ✅ What Was Fixed

### 1) Standalone `while` form now works correctly
Previously, scripts using this valid POSIX pattern could fail and leak `do` into command execution:

```sh
while
  <condition commands>
do
  <body>
done
```

**Implemented behavior:**
- `executeLines()` now recognizes both `while <condition>` and standalone `while`
- `executeWhile()` now supports multiline condition command lists between `while` and `do`
- Loop condition result is derived from the condition command block exit status
- Existing inline `while <condition>; do ...; done` behavior remains supported

### 2) `jarty-logo` parse path validated
The shell parser now accepts `/usr/bin/jarty-logo` syntax in `sh -n` mode, eliminating the previous `do` command resolution failure path for this script structure.

---

## 📝 Code Changes

### Version constants
- `wnus.cpp` line 566:
```cpp
const std::string WNUS_VERSION = "0.3.2.5";
```
- `release_current/wnus.cpp` line 566:
```cpp
const std::string WNUS_VERSION = "0.3.2.5";
```

### `sh` parser/runtime changes (main source)
- Updated `executeLines()` while detection to include standalone `while`
- Refactored `executeWhile()` to:
  - locate `do` once per loop block
  - execute multiline condition command list (`start+1` to `doLine`)
  - evaluate condition status from `g_lastExitStatus`
  - preserve existing condition expression handling for inline form

Equivalent runtime and version updates mirrored to:
- `release_current/wnus.cpp`

---

## 📚 Documentation Updates

Updated to reflect **v0.3.2.5**:
- `README.md`
- `MANUAL.md`
- `release_current/README.md`
- `release_current/MANUAL.md`

---

## 🧪 Verification Summary

### Build
✅ `./build.ps1` completed successfully  
✅ Compile + link successful  
✅ Output binary generated: `wnus.exe`

### Runtime checks
✅ `sh -n /usr/bin/jarty-logo` returns success (`EXIT=0`)  
✅ Multiline `while` parser path compiles and executes without `do` command leakage

---

## ⚠️ Compatibility Notes

- No command removals
- No option removals
- No external dependency changes
- This is a compatibility/stability patch release

---

## 🚀 Recommended Upgrade Path

1. Pull/update source
2. Rebuild:
```powershell
./build.ps1
```
3. Verify runtime version via shell banner/help output
4. Re-run shell scripts using multiline `while ... do ... done`

---

## Summary
**v0.3.2.5** is a focused shell compatibility release that fixes multiline POSIX `while` loop handling and synchronizes runtime/documentation versioning across active source trees.
