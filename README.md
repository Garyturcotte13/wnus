[![Version](https://img.shields.io/badge/version-0.1.4.8-orange.svg)](.)[![Size](https://img.shields.io/badge/size-7.1MB-blue.svg)](.)[![Platform](https://img.shields.io/badge/platform-Windows-blue.svg)](https://www.microsoft.com/windows)[![Build](https://img.shields.io/badge/build-passing-brightgreen.svg)](.)[![Tests](https://img.shields.io/badge/tests-10%2F10%20PASS-brightgreen.svg)](test_posix_simple.ps1)

# Windows Native Unix Shell (wnus)

**v0.1.4.8** - Comprehensive Unix/Linux command-line environment for Windows with **273 fully implemented commands** in pure C++ (zero external dependencies).

**Quick Stats:** 7.1 MB executable | 30-40 MB RAM | Windows 7+ | Test suite: 10/10 PASS

## ✨ Features

- 🔧 **273 commands** - uuencode, uudecode, pax, nc, ssh, scp, grep, sed, awk, tar, make, tcpdump, nmap, and more
- 📁 **Native NTFS** - Windows ACL integration, hard/symbolic links, full permission management
- 🔀 **Bash compatible** - pipes (`|`), redirects (`>`, `>>`), chaining (`&&`, `||`), background (`&`)
- 📖 **275 man pages** - comprehensive documentation for every command
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
- **OS:** Windows 7+ (Windows 10/11 recommended)
- **Disk:** 7.1 MB for executable
- **RAM:** 30-40 MB typical usage
- **Build:** C++ compiler (MSVC, MinGW, or Clang) for source compilation
- **Note:** gcc/g++ are *not* bundled with wnus; use your own installed toolchain.

### Download & Run
1. Download `wnus.exe` from releases
2. Run directly - no installation needed
3. Type `help` for command list or `man command` for documentation

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

### Command Categories

**File Operations:** cat, cp, mv, rm, mkdir, rmdir, touch, chmod, chown, chgrp, ln, stat, file, dd, install, truncate  
**Text Processing:** grep, sed, awk, cut, sort, uniq, tr, wc, head, tail, tee, fmt, fold, expand, unexpand, paste, join, split, nl  
**Archive/Compression:** tar, gzip, gunzip, zip, unzip, bzip2, bunzip2, xz, unxz, zcat, unrar  
**Network:** ssh, scp, sftp, ftp, ping, traceroute, tcpdump, nmap, nc, telnet, curl, wget, host, nslookup, dig  
**Process:** ps, top, kill, killall, pkill, nice, renice, bg, fg, jobs, wait, nohup, timeout  
**System:** df, du, free, uptime, uname, hostname, date, who, w, users, id, whoami, last, logname  
**Permissions:** chmod, chown, chgrp, umask, getfacl, setfacl  
**Search:** find, locate, which, whereis, type  
**Shell:** sh, bash, source, alias, unalias, history, export, env, set  
**Text Editors:** vi, vim, nano, ed, ex  
**Utilities:** echo, printf, test, expr, bc, calc, true, false, yes, seq, shuf, factor, base64  
**Service Management:** systemctl, service  
**Build Tools:** make, ar, nm, objdump, strip (compatibility wrappers). gcc/g++ are *not shipped*; they require an external compiler installed and on PATH.

### Manual Pages
All 275 commands have full manual pages accessible via:
```bash
man command_name
```

Or use `--help` flag:
```bash
command_name --help
```

## 🔍 Examples

### Basic Usage
```bash
# List files with details
ls -la

# Search for text in files
grep -r "pattern" /path/to/search

# Process text with AWK
awk '{print $1, $3}' file.txt

# Stream editing with sed
sed 's/old/new/g' file.txt

# Create tar archive
tar -czf archive.tar.gz directory/

# Extract archive
tar -xzf archive.tar.gz
```

### Network Operations
```bash
# Connect via SSH
ssh user@host

# Copy files via SCP
scp file.txt user@host:/path/

# Scan ports
nmap -p 1-1000 192.168.1.1

# Capture packets (requires admin)
tcpdump -i eth0 port 80

# Test connectivity
ping google.com
traceroute google.com
```

### Shell Scripting
```bash
# Simple script
./wnus.exe -c "
for i in 1 2 3; do
    echo Processing item $i
done
"

# Conditional execution
./wnus.exe -c "
if [ -f file.txt ]; then
    echo File exists
else
    echo File not found
fi
"

# AWK processing
./wnus.exe -c "awk 'BEGIN {sum=0} {sum+=$1} END {print sum}' numbers.txt"
```

### Process Management
```bash
# View processes
ps aux

# Monitor system
top

# Kill process
kill -9 1234

# Run in background
long_command &

# Manage jobs
jobs
fg %1
bg %2
```

## 🛠️ Technical Details

### Architecture
- **Language:** Pure C++ (C++11 standard)
- **Size:** 7.1 MB executable (57,263 lines of code)
- **Dependencies:** Zero external libraries (uses only Windows API and C++ standard library)
- **APIs Used:** Windows API, Winsock2, CNG Cryptography, Service Control Manager, DNS API
- **Compiler:** TDM-GCC 10.3.0+ or MSVC 2019+
- **Platform:** Windows 7, 8, 10, 11 (x86/x64)

### Security
- **Cryptography:** Windows CNG (Cryptography Next Generation) API
- **Algorithms:** AES-256-CBC, HMAC-SHA256, RSA-2048
- **Standards:** FIPS 140-2 validated cryptographic modules
- **SSH:** Full SSH-2 protocol implementation with secure key exchange

### Performance
- **Startup:** Instant (< 100ms typical)
- **Memory:** 30-40 MB RAM typical usage
- **Commands:** 273 fully implemented, 2 informational stubs (strace, journalctl)
- **Threads:** Single-threaded for simplicity and compatibility

## 📊 Command Implementation Status

- **Total Commands:** 275
- **Fully Implemented:** 273 (99.3%)
- **Informational Stubs:** 2 (strace, journalctl - Windows platform limitations)
- **Manual Pages:** 275 (100% documentation coverage)
- **Test Suite:** 10/10 PASS

### Recently Added (v0.1.4.8)
- **uuencode/uudecode** - RFC 1113 + RFC 4648 base64 encoding/decoding
- **pax** - POSIX portable archive exchange (create/extract archives)
- **nc (netcat)** - TCP/UDP network utility with client/server modes
- All implementations are fully internal with zero external dependencies

## 🧪 Testing

Run the test suite:
```powershell
.\test_posix_simple.ps1
```

Expected output:
```
=== POSIX Commands Test for WNUS v0.1.4.8 ===

1. Version check... PASS
2. getconf ARG_MAX... PASS: 32768
3. getconf PATH_MAX... PASS: 260
4. locale... PASS
5. locale -a... PASS (927 locales)
6. tput clear... PASS
7. tput sgr0... PASS
8. tput setaf 1... PASS
9. vi -h... PASS
10. link (create hardlink)... PASS

=== Summary ===
PASS: 10
FAIL: 0
Total: 10
```

## 📝 License

GNU General Public License v3.0 - See [LICENSE](GNU%20GENERAL%20PUBLIC%20LICENSE.txt) file for details.

## 🔗 Links

- **Documentation:** [MANUAL.md](MANUAL.md) - Complete user manual
- **Release Notes:** [RELEASE_NOTES.md](RELEASE_NOTES.md) - Version history
- **Latest Version:** [VERSION_0.1.4.8.md](VERSION_0.1.4.8.md) - Current release details

## 🙏 Acknowledgments

Built with pure C++ using only Windows API and C++ standard library. No external dependencies required.

---

**Windows Native Unix Shell** - Bringing the power of Unix/Linux command-line tools to native Windows.
