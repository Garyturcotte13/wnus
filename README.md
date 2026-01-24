[![Version](https://img.shields.io/badge/version-0.1.5.1-orange.svg)](.)[![Size](https://img.shields.io/badge/size-7MB-blue.svg)](.)[![Platform](https://img.shields.io/badge/platform-Windows-blue.svg)](https://www.microsoft.com/windows)[![Build](https://img.shields.io/badge/build-passing-brightgreen.svg)](.)[![Tests](https://img.shields.io/badge/tests-10%2F10%20PASS-brightgreen.svg)](test_posix_simple.ps1)

# Windows Native Unix Shell (wnus)

**v0.1.5.1** - Comprehensive Unix/Linux command-line environment for Windows with **276 fully implemented commands** in pure C++ (zero external dependencies).

**Quick Stats:** 7 MB | 30-40 MB RAM | Windows 7+ | All 276 commands fully implemented

## ✨ Features

- 🔧 **276 commands** - strace, journalctl, c-run, uuencode, uudecode, pax, nc, ssh, scp, grep, sed, awk, tar, make, tcpdump, nmap, and more
- 📁 **Native NTFS** - Windows ACL integration, hard/symbolic links, full permission management
- 🔀 **Bash compatible** - pipes (`|`), redirects (`>`, `>>`), chaining (`&&`, `||`), background (`&`)
- 📖 **276 man pages** - comprehensive documentation for every command
- 🌐 **Networking** - SSH/SCP/SFTP/FTP with AES-256 encryption, tcpdump, nmap, ping, traceroute
- 📦 **Archives** - tar, gzip, zip, RAR, xz/LZMA, bzip2 (all native implementations)
- 🔐 **Enterprise crypto** - Windows CNG API with FIPS 140-2 validated algorithms
- 💻 **Shell scripting** - POSIX sh with if/while/for, functions, variables, arithmetic expansion
- 🧮 **Text processing** - Full AWK interpreter, sed stream editor, grep with regex
- ⌨️ **Interactive** - tab completion, command history, aliases, Ctrl+C/Z process control

### Network Tools
- **SSH/SCP/SFTP** - Full SSH-2 protocol, AES-256-CBC encryption, HMAC-SHA256 integrity
- **FTP client** - Upload/download support with Windows CNG cryptography
- **tcpdump** - Real-time packet analysis using Windows raw sockets
- **nmap** - Full TCP connect port scanner with service detection (1-65535 ports)
- **ping/traceroute** - ICMP diagnostics with native Windows implementation

### Archive & Compression
- **tar** - Create/extract/list tar archives with compression
- **gzip/gunzip** - LZ77 compression via Windows Compression API
- **xz/unxz** - LZMA/LZMA2 compression (native implementation)
- **bzip2/bunzip2** - Burrows-Wheeler compression (native)
- **zip/unzip** - Full ZIP format support
- **RAR** - Native Windows RAR archive extraction

### Shell Features
- **sh command** - POSIX-compliant shell interpreter with complete scripting support
- **Variables** - `$VAR`, `${VAR}` expansion
- **Arithmetic** - `$((expression))` with full operators
- **Control flow** - if/then/elif/else/fi, while/do/done, for/do/done
- **Functions** - Define and call shell functions
- **Test expressions** - `[ ... ]` for file/string/numeric comparisons
- **Here-documents** - `<<DELIMITER` syntax for multi-line input
- **Command substitution** - `$(command)` for output capture
- **Quote handling** - Single and double quotes with escape sequences

### System Administration
- **Process management** - ps, top, kill, nice, bg, fg, jobs
- **User/group** - useradd, usermod, userdel, groupadd (Windows account integration)
- **Service control** - systemctl with Windows Service Control Manager
- **Permissions** - chmod, chown, chgrp with Windows ACL translation
- **Links** - ln for hard/symbolic links with NTFS support

## 🚀 Quick Start

### Requirements
- **OS:** Windows 7+  
- **Disk:** 7 MB | **RAM:** 30-40 MB typical  
- **Build:** C++ compiler (MSVC, MinGW, Clang) or run precompiled binary

### Download & Run
1. Download `wnus.exe` from releases
2. Run directly - no installation required
3. Type `help` or `man command` for documentation

### Building from Source

**Using PowerShell (recommended):**
```powershell
.\build.ps1
```

**Using CMake:**
```bash
mkdir build && cd build
cmake ..
cmake --build . --config Release
```

**Manual compilation:**
```bash
g++ -O3 -std=c++11 -municode -DUNICODE -D_UNICODE -mwindows wnus.cpp -o wnus.exe \
    -lws2_32 -liphlpapi -lbcrypt -lwtsapi32 -lwbemuuid -lole32 -loleaut32 \
    -lnetapi32 -ldnsapi -ladvapi32 -lsetupapi -lshell32
```

## 📖 Documentation

All 276 commands have full manual pages:
```bash
man command_name      # Detailed manual
command_name --help   # Quick reference
```

## 🔍 Examples

```bash
# Files
grep -r "pattern" . | head -20
awk '{print $1, $3}' file.txt

# Archives
tar -czf backup.tar.gz directory/
tar -xzf backup.tar.gz

# Network
ssh user@host
scp file.txt user@host:/path/
nmap -p 1-1000 192.168.1.1
ping google.com

# Shell scripting
for i in {1..5}; do echo $i; done
if [ -f file.txt ]; then cat file.txt; fi

# Processes
ps aux | grep pattern
top
kill -9 1234
```

## 🛠️ Technical Details

| Aspect | Details |
|--------|---------|
| **Language** | Pure C++11 |
| **Size** | 7 MB (57,986 lines) |
| **Dependencies** | Zero (Windows API + C++ stdlib only) |
| **Cryptography** | Windows CNG (AES-256, HMAC-SHA256) |
| **Memory** | 30-40 MB typical |
| **Platform** | Windows 7+ (x86/x64) |
| **Commands** | 276 fully implemented (0 stubs) |
| **Startup** | < 100ms |

## 📊 Status

- **Total Commands:** 276 (100% fully implemented, 0 stubs)
- **Manual Pages:** 276 (100% coverage)
- **Test Suite:** 10/10 PASS
- **Documentation:** Complete (MANUAL.md, RELEASE_NOTES.md)

## 🧪 Testing

```powershell
.\test_posix_simple.ps1
```

Run the test suite - expects 10/10 PASS

## 📝 License

GNU General Public License v3.0 - See [LICENSE](GNU%20GENERAL%20PUBLIC%20LICENSE.txt)
