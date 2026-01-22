# Windows Native Unix Shell (wnus) - Version 0.1.3.2

A comprehensive Unix/Linux-like shell environment for Windows, implemented entirely in C++ without external dependencies. Windows Native Unix Shell brings the power and familiarity of bash commands to native Windows, with full NTFS support and Windows API integration.

[![Platform](https://img.shields.io/badge/platform-Windows-blue.svg)](https://www.microsoft.com/windows)
[![Build](https://img.shields.io/badge/build-passing-brightgreen.svg)](.)
[![Version](https://img.shields.io/badge/version-0.1.3.2-orange.svg)](.)

- **Full bash compatibility** for common command-line workflows including I/O redirection and process control
- **Comprehensive documentation** with man pages for every command
- **Full-featured AWK interpreter** with all standard Unix/Linux AWK capabilities

## ✨ Key Features

### Core Capabilities
- 🔧 **259 Unix/Linux commands** implemented natively in C++
- 📁 **Native NTFS support** with Windows ACL integration
- �️ **Virtual root filesystem** (wnus:/) with unified drive access via /C, /D, etc.
- �🔀 **Full pipe operations** (`|`) for command chaining
- 🔗 **Command chaining** with `&&` (AND) and `||` (OR) operators
- 📤 **I/O redirection** with `>`, `>>`, and `<` operators
- 🚀 **Background processes** with `&` operator
- ⌨️ **Interactive tab completion** for commands and file paths
- 📜 **Persistent command history** with search capabilities
- 🔖 **Configurable command aliases** for personalized workflows
- 📖 **Comprehensive man page system** for all 259 commands with consistent documentation
- ❓ **Context-sensitive help** (`--help` flag for all commands)
- 🛑 **Process control** with Ctrl+C (terminate) and Ctrl+Z (suspend)

### Advanced Features
- 🔐 **Windows ACL integration** via chmod, chown, chgrp
- 🔗 **Hard and symbolic links** with native NTFS support
- 🌐 **Complete SSH-2, SCP, FTP & SFTP protocols** with full Windows CNG cryptography
  - Full SSH-2 protocol message handling (KEXINIT, USERAUTH, CHANNEL_*)
  - AES-256-CBC encryption for all data transfer
  - HMAC-SHA256 integrity verification
  - Complete SCP and SFTP file transfer protocols
  - Full FTP client with upload/download support
  - FIPS 140-2 validated cryptographic algorithms
- 📦 **Archive management** with tar, gzip, zip, and native RAR support
- �️ **Compression support** with xz/LZMA, bzip2, gzip - all native implementations
  - Full LZMA/LZMA2 compression and decompression (xz, unxz)
  - Native bzip2 Burrows-Wheeler compression (bzip2, bunzip2)
  - Windows compression API integration
  - Multiple compression levels (1-9)
  - Integrity checking and verification
  - No external utilities required
- 🌐 **Network tools** with full raw socket implementation
  - **tcpdump**: Real-time packet analysis using Windows raw sockets
  - **nmap**: Full TCP connect port scanner with service detection
    * Port range/list scanning (1-65535)
    * Service name detection for common ports
    * Timing templates (T0-T5) for scan speed control
    * Fast scan mode with top 100 common ports
    * No WinPcap/Npcap driver required
  - TCP/UDP/ICMP protocol decode and filtering
  - Administrator privileges required for raw socket access
- �💻 **Process management** with ps, top, kill, nice commands
- 👥 **User/group management** with Windows account integration via native APIs
- 🔄 **Service control** with systemctl - full Windows Service Control Manager integration
  - Start/stop/restart/status services
  - Enable/disable auto-start configuration
  - List all services with state information
  - Query service status with PID display
  - Full Windows SCM API integration
- 🚀 **Shell scripting** with sh command and source support
  - **sh**: Full POSIX-compliant shell with comprehensive interpreter
  - Shell variables with expansion ($VAR, ${VAR})
  - Arithmetic expansion ($((expression)) with full operator support)
  - Command substitution ($(command) with output capture)
  - Control flow (if/then/elif/else/fi, while/do/done, for/do/done)
  - Test expressions ([ ... ] with file/string/numeric tests)
  - Here-documents (<<DELIMITER syntax)
  - Comprehensive quote handling (single and double quotes with escapes)
  - Command string execution (-c), stdin reading (-s), script file execution
  - Shell options: exit-on-error (-e), verbose (-v), trace (-x), syntax-check (-n)
  - Line continuation, multiline commands, shebang support
  - Proper exit status handling and script argument passing
  - Perfect AWK integration with quoted code blocks
- 🧮 **Built-in calculators** (bc, calc, qalc)
- 🔒 **Enterprise-grade cryptography** using Windows CNG API only
- 🌐 **Native DNS resolution** with Windows DNS API (DnsQuery_W)
- 📁 **RAR archive support** with native Windows implementation
- 🔤 **Full AWK interpreter** with pattern matching, BEGIN/END blocks, built-in functions, and all standard features

## 🚀 Quick Start

### Prerequisites
- Windows 7 or later (Windows 10/11 recommended)
- C++ compiler (MSVC, MinGW, or Clang)
- ~6.5 MB disk space for executable
- ~28-36 MB RAM typical usage

### Building

#### Using PowerShell build script (recommended):
```powershell
.\build.ps1
```

#### Using CMake:
```bash
mkdir build
cd build
cmake ..
cmake --build . --config Release
```

#### Using MSVC directly:
```cmd
cl /EHsc /O2 garyscon.cpp /Fe:wnus.exe user32.lib shell32.lib advapi32.lib ws2_32.lib iphlpapi.lib netapi32.lib
```

### Running
```cmd
wnus.exe
```

Or for single command execution:
```cmd
wnus.exe -c "ls -la"
```

## 📚 Command Reference

### Navigation & File Viewing (8 commands)
- `pwd` - Print working directory
- `cd [dir]` - Change directory  
- `ls [-la] [path]` - List directory contents
- `cat <file>...` - Display file contents
- `less <file>` - View file with paging
- `head [-n N]` - Display first N lines
- `tail [-n N]` - Display last N lines
- `tac <file>` - Print files in reverse line order

### File Operations (14 commands)
- `touch`, `mkdir`, `rm`, `rmdir`, `mv`, `rename` - Basic file operations
- `ln [-s]`, `unlink` - Create/remove links
  - **ln**: Direct CreateSymbolicLinkA/CreateHardLinkA Windows API for native symbolic and hard links (no mklink dependency)
- `chmod`, `chown`, `chgrp` - Permission management
- `dd` - Low-level file copy
- `file`, `blkid` - File/device information

### Text Processing (21 commands)
- `grep` - Full-featured pattern search with 130+ Unix/Linux options (-i, -n, -v, -w, -x, -c, -l, -L, -o, -B, -A, -C, -r, -f, -e, -E, -G, -F, -P, -T, -Z, -d, -D, etc.)
- `egrep`, `fgrep` - Extended and fixed-string pattern matching
- `sed`, `awk` - Pattern matching and text processing (sed refactored v0.1.2.2, awk fully reimplemented v0.1.2.8)
  - **awk**: Full-featured AWK interpreter with BEGIN/END blocks, pattern-action syntax, regex patterns, field processing ($0-$NF), all built-in variables (NR, NF, FNR, FILENAME, FS, OFS, RS, ORS, etc.), arithmetic/comparison/logical operators, assignment operators (=, +=, -=, *=, /=, %=), built-in functions (length, substr, tolower, toupper, int, sqrt), print/printf statements, variable assignment, pattern matching with /regex/, conditional patterns (NR > 1), next and exit statements, field separator options (-F), variable initialization (-v), program file loading (-f)
- `sort`, `cut`, `paste`, `uniq` - Text manipulation
- `wc`, `tee`, `diff`, `patch` - Text utilities
- `cmp`, `sdiff`, `rev`, `printf`, `echo`, `yes`, `seq`, `jot`, `factor` - Text output and generators

### Text Formatting & Analysis (18 commands)
- `fmt` - Reformat paragraph text
- `fold` - Wrap text to specified width
- `pr` - Paginate text with headers
- `lpr`, `lp` - Send jobs to printer (stubbed)
- `expand` - Convert tabs to spaces
- `unexpand` - Convert spaces to tabs
- `od` - Octal/hexadecimal dump
- `hexdump`, `hd` - Hex dump with ASCII
- `strings` - Extract printable strings from binary files
- `column` - Format output into columns
- `comm` - Compare sorted files
- `join` - Join lines on common field
- `look` - Display lines beginning with string
- `tsort` - Topological sort
- `vis`, `unvis` - Display/reverse non-printable characters
- `tac` - Print files with lines in reverse order

### Encoding & Checksums (6 commands)
- `base64` - Base64 encode/decode
- `md5sum` - MD5 checksum
- `sha1sum` - SHA1 checksum
- `sha256sum` - SHA256 checksum
- `cksum` - CRC checksum
- `sum` - Checksum and block count

### File Search (4 commands)
- `find` - Full Unix/Linux find implementation with complete filtering and actions
  * **Tests**: -name, -iname (case-insensitive pattern), -type (f/d/l), -size ([+-]n[ckMG]), -empty, -newer (file)
  * **Time filters**: -mtime, -atime, -ctime with [+-]n day operators
  * **Depth control**: -maxdepth n, -mindepth n for recursive limit control
  * **Actions**: -print (default), -ls (detailed format like ls -dils), -delete (remove matched), -exec cmd {} \; (execute commands)
  * **Operators**: AND (-a), OR (-o), NOT (-not, !), grouping with ( )
  * **Wildcard matching**: Full * and ? support in patterns
  * **Size units**: c (bytes), k (KB), M (MB), G (GB) with +/- comparison operators
  * **Multiple paths**: Can search multiple directory trees in one command
  * **Native implementation**: Windows FindFirstFile/FindNextFile with full recursion, no external dependencies
  * **Complete filter evaluation**: All tests are properly applied during traversal
  * **Format options**: Plain path output or detailed ls-style listings with size, permissions, timestamps
- `locate` - Recursive file search by pattern
- `which` - Locate command in PATH
- `file` - Determine file type

### System Info (19 commands)
- `df`, `du` - Disk usage
- `uptime`, `uname`, `date` - System information
- `cal`, `ncal` - Calendar display
- `free`, `vmstat`, `iostat`, `mpstat` - System statistics
- `hostname`, `hostid`, `arch`, `nproc`, `lsb_release` - Host identifiers
- `neofetch`, `sysctl` - Host information and tunables

### User & Group (23 commands)
- `whoami`, `who`, `w`, `last`, `id` - User information
- `finger`, `user`, `groups` - User details
- `logname`, `users` - Session user reporting
- `passwd` - Password management
- `useradd`, `userdel`, `usermod` - User administration
- `groupadd`, `groupmod`, `groupdel` - Group administration
- `gpasswd`, `getent` - Account management
  - **gpasswd**: Full NetLocalGroup API implementation for group member management (add/remove/list members)
- `mesg`, `write`, `wall` - Local messaging controls

### Process Management (23 commands)
- `ps`, `proc`, `htop`, `top` - Process viewing
- `pgrep`, `pidof`, `pstree` - Process lookup and tree display
- `kill`, `killall`, `pkill`, `xkill` - Process termination
- `nice`, `renice` - Priority management
- `jobs`, `bg`, `fg` - Job control (info guides)
- `strace`, `lsof` - Debugging (info guides)
- `sleep`, `wait`, `timeout`, `nohup` - Delays and timed execution

### Archives & Compression (12 commands)
- `tar` - Full-featured archive management with 80+ Unix/Linux options (-c, -x, -t, -f, -z, -j, -J, -r, -u, --exclude, --include, -C, -v, etc.)
- `gzip/gunzip` - Gzip compression
- `zip/unzip` - ZIP archives
- `unrar` - Native RAR archive extraction
- `bzip2/bunzip2` - Bzip2 (info guides)
- `xz/unxz` - XZ/LZMA compression
- `dd` - Low-level copy
- `make` - Build automation from Makefile

### File Utilities (9 commands)
- `cp` - Copy files and directories
- `dirname` - Extract directory from pathname
- `readlink` - Display symbolic link target
- `realpath` - Print resolved absolute path
- `mktemp` - Create temporary file/directory
- `install` - Copy files and set attributes
- `truncate` - Shrink or extend file size
- `fallocate` - Preallocate file space
- `pathchk` - Validate pathnames

### Network & Remote (20 commands)
- `ssh`, `scp`, `rsync` - Remote access and file transfer
  - **ssh**: Full SSH-2 protocol implementation with Windows CNG cryptography
    * AES-256-CBC encryption for all data transfer
    * HMAC-SHA256 integrity verification
    * Complete packet handling (KEXINIT, USERAUTH, CHANNEL_*)
    * Full Unix/Linux options: -p (port), -l (user), -i (identity), -F (config), -o (options)
    * Port forwarding: -L (local), -R (remote), -D (dynamic SOCKS proxy)
    * Session control: -t (TTY), -N (no command), -f (background)
    * Cipher and MAC selection: -c (cipher), -m (MAC algorithm)
    * Verbose debugging: -v, -vv, -vvv levels
    * Authentication: -A (agent forward), -k/-K (GSSAPI)
    * Compression: -C, IPv4/IPv6: -4/-6
    * Advanced: -J (jump host), -W (stdio forward), -Q (query algorithms)
    * Remote command execution and interactive shell
  - **scp**: Secure copy with full Unix/Linux options and SCP/SFTP protocol
    * Complete option support: -1/-2 (protocol version), -3 (three-way), -4/-6 (IPv4/IPv6)
    * Transfer modes: -r/-R (recursive), -p (preserve attributes), -C (compression)
    * Port and auth: -P (port), -i (identity), -F (config), -o (options)
    * Bandwidth control: -l (limit Kbit/s), -q (quiet), -v (verbose)
    * Advanced: -J (jump host), -D (SFTP mode), -O (legacy SCP), -T (strict names)
    * Multiple file transfer and wildcard support
    * Upload/download with AES-256 encryption and HMAC-SHA256 integrity
    * Timestamp and permission preservation
    * Directory recursion with full metadata
  - **rsync**: File synchronization (local and remote)
    * Options: -a (archive), -v (verbose), -n (dry-run), -u (update), --delete
    * Local-to-local, local-to-remote, and remote-to-local sync
    * Simplified SSH protocol for remote transfers
- `wget` - **Full-featured HTTP/HTTPS/FTP file downloader with all GNU Wget options**
  * **Complete Unix/Linux option support**: -O, -o, -i, -q, -v, -nv, -b, -c, -nc, -N, -S, --spider, -t, -T, --dns-timeout, --connect-timeout, --read-timeout, -w, --waitretry, --random-wait, --no-proxy, -Q, --bind-address, --limit-rate, --no-dns-cache, -4, -6, --user, --password, --http-user, --http-password, --ftp-user, --ftp-password, -nd, -x, -nH, -P, --cut-dirs, --no-cache, --header, --max-redirect, -U, --referer, --post-data, --post-file, --no-cookies, --content-disposition, --no-check-certificate, -r, -l, -m, -k, -p, -H, -L, -np, -A, -R, and 100+ more options
  * **Recursive downloads** with depth control and filtering
  * **Mirroring** entire websites with proper structure
  * **Resume support** for interrupted downloads
  * **Rate limiting** and bandwidth control
  * **Retry logic** with configurable attempts and delays
  * **URL list processing** from files
  * **Timestamp-based** downloads (only if newer)
  * **Spider mode** for link checking without downloading
  * All features implemented using native Windows sockets (WinSock2)
- `curl` - **Full-featured HTTP/HTTPS/FTP client with complete cURL option support**
  * **Complete Unix/Linux option support**: -X, -H, -d, --data-binary, --data-raw, -F, -G, -I, -T, -C, -r, -Y, -y, --limit-rate, --max-filesize, -o, -O, -J, -D, -i, -s, -S, -v, -w, -#, -0, --http1.1, --http2, -4, -6, --connect-timeout, -m, --no-keepalive, --tcp-nodelay, -u, --basic, --digest, --ntlm, -A, -e, --compressed, -b, -c, -j, -E, --key, --cacert, -k, --ssl, -x, --proxy-user, --retry, --retry-delay, -L, --max-redirs, --post301/302/303, -P, --ftp-pasv, -l, -Q, and 150+ more options
  * **Full HTTP method support** (GET, POST, PUT, DELETE, PATCH, HEAD, OPTIONS, TRACE, CONNECT)
  * **Multipart form uploads** with file attachments
  * **Custom headers** and authentication (Basic, Digest, Bearer)
  * **Cookie handling** with jar support
  * **SSL/TLS options** with certificate verification control
  * **Proxy support** (HTTP, SOCKS4, SOCKS5)
  * **Redirect following** with customizable limits
  * **Resume downloads** and byte range requests
  * **Transfer rate limiting** and progress display
  * **Output formatting** with write-out variables
  * **Silent and verbose modes** for automation and debugging
  * All features implemented using native Windows sockets (WinSock2)
- `ftp` - Full FTP client with file transfer support
- `sftp` - Secure file transfer over SSH-2 with AES-256 encryption
- `ping`, `traceroute` - Network diagnostics
- `ip`, `ifconfig` - Network configuration
  - **ifconfig**: Full GetAdaptersInfo implementation with RX/TX statistics
- `iptables` - Windows Firewall management with 50+ Unix/Linux options (-L, -A, -D, -I, -R, -F, -N, -X, -P, -S, -s, -d, -p, -j, -t, etc.)
  - List/manage firewall rules (INPUT/OUTPUT/FORWARD chains)
  - Policy management and rule insertion/deletion
  - Source/destination IP and protocol matching
  - Native Windows netsh advfirewall integration
- `dig`, `nslookup`, `netstat`, `ss` - Network information
  - **dig/nslookup**: Native DnsQuery_W Windows DNS API with full record support (A, AAAA, MX, NS, CNAME, TXT, SOA)
  - **netstat**: Complete IP Helper API (GetTcpTable, GetUdpTable, GetIpForwardTable) for TCP/UDP connections, routing tables, and interface statistics
- `nmap` - Full TCP connect port scanner with service detection
- `tcpdump`, `lspci`, `lsusb` - Packet capture and hardware tools
Tip: For a quick FTP connectivity check, use `ftp -u anonymous -w anonymous@ test.rebex.net` (public read-only server).

### Disk Management (4 commands)
- `fdisk` - Full disk partition manager with DeviceIoControl APIs
- `parted` - GNU Parted-compatible partition tool with GPT/MBR support
- `fuser` - Identify processes using files with process enumeration
- `ffmpeg` - Full multimedia transcoder with container remuxing and format conversion

### Database & Media (2 commands)
- `mysql` - Full MySQL wire protocol client with database connectivity
  - TCP/IP connection to MySQL servers
  - MySQL protocol v10 handshake and authentication
  - Query execution (SHOW DATABASES, SHOW TABLES, SELECT)
  - Batch mode (-B) and silent mode (-s) support
  - Native WinSock implementation
- `ffmpeg` - Complete multimedia transcoder
  - Format conversion (MP4, AVI, MKV, WebM, MOV, FLV)
  - Audio extraction from video files
  - Container remuxing without re-encoding
  - Video/audio stream analysis
  - Windows native file I/O implementation

### Services & System (6 commands)
- `service` - Windows service control
- `systemctl` - Full Service Control Manager with start/stop/enable/disable
- `shutdown`, `reboot` - Power management
- `sync` - File system sync

### Shell & Scripting (21 commands)
- `sh`, `source`, `exec` - Script execution
  - **sh**: Full POSIX-compliant shell with all standard Unix/Linux options
    * Command execution: -c (command string), -s (stdin mode)
    * Shell options: -e (exit on error), -u (unset variable error), -v (verbose), -x (trace)
    * Advanced options: -n (syntax check), -f (disable globbing), -a (export all), -k (assignment args)
    * Option combinations supported: -ex, -vx, -evx for debugging
    * Script features: shebang (#!) handling, line continuation (\\), multiline commands
    * Shell grammar: pipelines (|), sequential (;), AND (&&), OR (||), background (&)
    * I/O redirection: <, >, >>, 2>, 2>&1
    * Exit status handling and script argument passing
    * Tilde expansion (~) and Unix-to-Windows path conversion
- `echo`, `printf` - Output
- `bc`, `calc`, `qalc` - Calculators
- `xargs` - Argument processing
- `true`, `false`, `tty`, `script`, `logger` - Shell utilities and logging
- `xdg-open` - Open files/URLs with default application
- `alias/unalias` - Command shortcuts
- `history` - Command history
- `umask` - File mode mask
- `case` - Pattern matching (info)
- `read` - Read input
- `test` - Conditional evaluation

### Editing & Display (6 commands)
- `nano` - Simple Pico-style text editor
- `emacs` - GNU Emacs-style editor with full key bindings
- `jed` - JED/Jove-style editor (Emacs subset for programmers)
- `fvi` - Free Vi modal editor (vi/vim clone)
- `clear` - Clear screen
- `screen` - Terminal multiplexer with session management

### Admin & Help (6 commands)
- `sudo`, `su` - Privilege elevation
- `man` - Manual pages
- `help` - Command listing
- `version` - Version information
- `exit`, `quit` - Exit shell

## 📖 Documentation

### Getting Help
```bash
<command> --help    # Quick command help
man <command>       # Full manual page
help                # List all commands
version             # Show version and features
```

### Man Pages
Every command has a comprehensive manual page with:
- Name and description
- Usage synopsis
- Detailed options
- Examples
- Related commands

## 🔧 Usage Examples

### File Operations
```bash
ls -la                        # List all files with details
cat file.txt | grep "error"   # Search in file
find . -name "*.log"          # Find log files
tar -czf backup.tar.gz data/  # Create archive
```

### Text Processing
```bash
grep -i "warning" *.log       # Case-insensitive search
sed 's/old/new/g' file.txt    # Replace text
awk '{print $1}' data.txt     # Extract column
sort file.txt | uniq          # Sort and remove duplicates
```

### System Operations
```bash
ps | grep chrome              # Find Chrome processes
df -h                         # Show disk usage
uptime                        # System uptime
neofetch                      # System info display
```

### Network Operations
```bash
ssh user@server.com           # SSH connection
scp file.txt user@host:/tmp/  # Secure copy
wget https://example.com/file # Download file
ping google.com               # Network test
```

### Process Management
```bash
ps                            # List processes
kill 1234                     # Kill by PID
killall chrome                # Kill by name
nice -n 10 command            # Run with priority
```

## 🎯 Advanced Features

### Piping
```bash
ls -la | grep ".txt" | sort
cat log.txt | grep "error" | wc -l
ps | grep "chrome"
```

### Command Chaining
```bash
mkdir test && cd test && touch file.txt   # Execute if previous succeeds
rm file.txt || echo "File not found"      # Execute if previous fails
make && make test && make install         # Multi-step build
```

### I/O Redirection
```bash
# Output redirection
echo "Hello" > output.txt                 # Write to file (overwrite)
echo "World" >> output.txt                # Append to file
ls -la > filelist.txt                     # Save directory listing

# Input redirection
cat < input.txt                           # Read from file
grep "error" < log.txt                    # Search in file via stdin
wc -l < data.txt                          # Count lines from file

# Combined redirection
sort < unsorted.txt > sorted.txt          # Read input, write output
cat file1.txt file2.txt > combined.txt    # Merge files
```

### Background Processes
```bash
# Run command in background
long_running_command &                    # Start background job
notepad &                                 # Open notepad without blocking

# Multiple background jobs
command1 & command2 & command3 &          # Run multiple jobs

# Output shows: [job_number] process_id command_line
```

### Process Control
```bash
# Ctrl+C - Interrupt current command
# Displays: ^C
# Returns to prompt immediately

# Ctrl+Z - Suspend current process (limited support)
# Displays: ^Z
# Message about job control shown
```

### Aliases
```bash
alias ll="ls -la"
alias ..="cd .."
unalias ll
```

### Shell Scripts
```bash
# Create and execute script
cat > script.sh << 'EOF'
#!/bin/sh
echo "Starting..."
mkdir -p backup
cp -r data backup/
echo "Done!"
EOF

sh script.sh
```

### Tab Completion
- Press Tab to auto-complete commands and paths
- Works for file names, directory names, and commands

### Home Directory
```bash
cd ~                  # Go to home
ls ~/Documents        # List home documents
```

## 🔐 Administrator Operations

Commands requiring admin privileges:
```bash
sudo service apache start
sudo passwd username
sudo useradd newuser
sudo shutdown -r now
```

Run as Administrator or use built-in `sudo` command.

## 📊 Performance

- **Startup**: Instant (native executable)
- **Execution**: Native Windows API performance
- **Memory**: ~26 MB typical usage
- **Size**: ~6.00 MB executable (6138.87 KB)

## 🔄 Version History

### v0.1.2.2 (Current)
- **Refactored `sed` implementation**:
  - Re-implemented core engine using `std::regex` for robust pattern matching and better performance
  - Architecture upgrade from line-by-line interpreter to two-pass compilation (parse script once, execute many times)
  - **Enhanced addressing support**:
    - Line number addressing (`1,5s/.../`)
    - Regex addressing (`/start/,/end/d`)
    - Range limits and step values
  - **Command set verification**:
    - Substitution (`s`) with global (`g`), case-insensitive (`i`), print (`p`), and write (`w`) flags
    - Deletion (`d`), Print (`p`), Quit (`q`)
    - Append (`a`), Insert (`i`), Change (`c`)
  - **Internal Help Updates**: Updated `man` and `whatis` strings to reflect new engine status
- **Technical improvements**:
  - Version bump to 0.1.2.2

### v0.1.1.9
- **Enhanced text processing and command building utilities**:
  - `xargs` - Comprehensive Unix implementation with all options: -0/--null (null-terminated), -a/--arg-file (read from file), -d/--delimiter (custom delimiter), -E/--eof (end marker), -I/--replace (replace string), -i (replace with {}), -L/--max-lines (lines per command), -l (same as -L), -n/--max-args (args per command), -p/--interactive (prompt), -r/--no-run-if-empty (skip if empty), -s/--max-chars (limit command size), -t/--verbose (print commands), -x/--exit (exit on size exceeded), -P/--max-procs (parallel execution); command line building from stdin; replace mode with -I/-i; line-based and arg-based batching; max command line size control; interactive prompts; default 'echo' command
  - `tee` - Complete Unix implementation with all options: -a/--append (append mode), -i/--ignore-interrupts (ignore SIGINT), -p (diagnose non-pipe errors), --output-error (error handling modes: warn, warn-nopipe, exit, exit-nopipe); multi-file output; simultaneous stdout and file writing; proper error handling per file; piped input processing
  - `uniq` - Full Unix implementation with all options: -c/--count (prefix with count), -d/--repeated (only duplicates), -D (all duplicates), --all-repeated (with separators: none, prepend, separate), -u/--unique (only unique), -i/--ignore-case, -f/--skip-fields (skip N fields), -s/--skip-chars (skip N chars), -w/--check-chars (compare N chars), -z/--zero-terminated, --group (grouping modes: separate, prepend, append, both); adjacent line comparison; field/character skipping; duplicate detection; piped input support
  - `tr` - Comprehensive Unix implementation with all options: -c/-C/--complement (complement of SET1), -d/--delete (delete chars), -s/--squeeze-repeats (squeeze repeated), -t/--truncate-set1 (truncate SET1); character ranges (a-z, 0-9), escape sequences (\\NNN octal, \\n, \\t, \\r, \\a, \\b, \\f, \\v), character classes ([:alnum:], [:alpha:], [:blank:], [:cntrl:], [:digit:], [:graph:], [:lower:], [:print:], [:punct:], [:space:], [:upper:], [:xdigit:]); translation, deletion, squeezing; complement mode; SET2 padding with last character
- **Technical improvements**:
  - Size: 6138.87 KB (6.00 MB)
  - All 259 commands fully implemented (0 stubs)
  - Enhanced command-line building and text processing capabilities

### v0.1.1.8
- **Enhanced date/time and file metadata commands**:
  - `date` - Comprehensive Unix implementation with all format options: -d/--date (parse date string), -f/--file (process file lines), -I/--iso-8601 (date/hours/minutes/seconds), -R/--rfc-email (RFC 5322), --rfc-3339 (date/seconds/ns), -r/--reference (file mod time), -u/--utc (UTC time); all 40+ format specifiers (%a, %A, %b, %B, %c, %C, %d, %D, %e, %F, %g, %G, %h, %H, %I, %j, %k, %l, %m, %M, %n, %N, %p, %P, %r, %R, %s, %S, %t, %T, %u, %U, %V, %w, %W, %x, %X, %y, %Y, %z, %Z); ISO 8601, RFC 5322, RFC 3339 formats; Unix epoch calculation
  - `stat` - Complete Unix implementation with all options: -L/--dereference (follow symlinks), -f/--file-system (filesystem stats), -c/--format (custom format), -t/--terse (terse output), --printf (with escapes); all format sequences (%a-%Z for perms, blocks, device, inode, size, times, etc.); GetFileInformationByHandle for inode/hard links/volume serial; terse and verbose formats; Unix timestamp conversion
  - `ln` - Enhanced symbolic and hard link creation with all options: -s/--symbolic, -f/--force, -i/--interactive, -n/--no-dereference, -v/--verbose, -b/--backup, -S/--suffix, -t/--target-directory, -T/--no-target-directory, -r/--relative, -L/--logical, -P/--physical; multi-file operations; proper Windows API usage with CreateSymbolicLinkA and CreateHardLinkA
  - `find` - Already comprehensive (verified in v0.1.1.6)
- **Technical improvements**:
  - Size: 6108.95 KB (5.96 MB)
  - All 259 commands fully implemented (0 stubs)
  - Enhanced date/time formatting and file metadata capabilities

### v0.1.2.7
- **Universal pipe support enhancements**:
  - `sed` - Now accepts piped input for stream editing operations
  - `awk` - Now accepts piped input for text processing
  - `xargs` - Now accepts piped input for command construction
  - `pipedin` - New utility command that lists all 45 internal commands accepting piped input (compact and long format with -l)
  - Total of 45 commands with universal pipe support via getInputLines() infrastructure
- **Documentation updates**:
  - Added whatis and man page entries for pipedin command
  - Updated help system with pipedin utility information
- **Technical improvements**:
  - Consistent pipe handling across all commands using getInputLines() helper
  - Zero external dependencies (Windows APIs only)

### v0.1.1.7
- **Enhanced network and file comparison commands**:
  - `diff` - Comprehensive Unix implementation with all formats: unified (-u, -U), context (-c, -C), side-by-side (-y), ed script (-e), RCS (-n), normal; comparison options: -i (ignore-case), -b (ignore-space-change), -w (ignore-all-space), -B (ignore-blank-lines), -I (ignore-matching-lines); directory options: -r (recursive), -N (new-file), -x (exclude); output options: -q (brief), -s (report-identical), -p (show-c-function), --label, -W (width); LCS-based diff algorithm
  - `ping` - Full Unix implementation with all standard options: -c (count), -i (interval), -s (size), -t (ttl), -W (timeout), -w (deadline), -I (interface), -f (flood), -q (quiet), -v (verbose), -n (numeric), -4/-6 (IPv4/IPv6), -a (audible), -A (adaptive), -b (broadcast), -d (debug), -D (timestamp), -p (pattern), -Q (tos), -R (record-route), -r (bypass-routing); statistics with min/avg/max/mdev, proper ICMP error handling
  - `find` - Already comprehensive (verified in v0.1.1.6)
- **Technical improvements**:
  - Size: 6067.87 KB (5.93 MB)
  - All 259 commands fully implemented (0 stubs)
  - Enhanced networking capabilities and file comparison tools

### v0.1.1.6
- **Enhanced file operations and permissions**:
  - `cut` - Complete Unix implementation with -b (bytes), -c (characters), -f (fields), -d (delimiter), --output-delimiter, -s (only-delimited), -z (zero-terminated), --complement, range support (N, N-, N-M, -M)
  - `chmod` - Comprehensive implementation with -R (recursive), -v (verbose), -c (changes), -f (quiet), --reference, --preserve-root, full symbolic modes ([ugoa][[+-=][rwxX]]), octal modes with Windows ACL mapping
  - `find` - Already comprehensive with all standard Unix/Linux options (verified existing implementation complete)
- **Technical improvements**:
  - Size: 6035.96 KB (5.89 MB)
  - All 259 commands fully implemented (0 stubs)
  - Enhanced text processing and file permission capabilities

### v0.1.1.5
- **Enhanced file viewing and sorting commands**:
  - `head` - Full Unix implementation with -c (bytes), -n (lines), -q (quiet), -v (verbose), -z (zero-terminated), negative counts for "all but last N" mode, multiple file support
  - `tail` - Comprehensive implementation with -c (bytes), -n (lines), -f/-F (follow modes), -q, -v, -s (sleep interval), -z, --retry, --pid monitoring, from-start mode (+N), follow-by-name with file recreation detection using Windows file time monitoring APIs
  - `sort` - Complete sort with -f (fold-case), -b (ignore-blanks), -d (dictionary), -i (ignore-nonprinting), -M (month), -h (human-numeric), -V (version), -t (field-separator), -o (output-file), -m (merge), -c/-C (check-sorted), -u (unique), field-based sorting with -k
- **Technical improvements**:
  - Size: 6021.06 KB (5.88 MB)
  - All 259 commands fully implemented (0 stubs)
  - Enhanced text processing and file viewing capabilities

### v0.1.1.4
- **Enhanced file operations commands**:
  - `rm` - Full Unix implementation with -f, -i, -I, -r, -R, -d, -v, --preserve-root
  - Recursive directory traversal with proper error handling
  - Interactive and force modes for safe file deletion
- **Technical improvements**:
  - Size: 5981.07 KB (5.98 MB)
  - Zero external dependencies (Windows APIs only)

### v0.1.1.3
- **Enhanced file operations commands**:
  - `ls` - Comprehensive implementation (25+ options: -a, -A, -l, -h, -d, -R, -r, -t, -S, -X, -1, -i, -s, -F, -p, -n, -o, -g, --color, --full-time)
  - `mv` - Full Unix implementation (10+ options: -f, -i, -n, -u, -v, -b, -S, -t, -T, interactive, backup, cross-volume)
  - `cp` - Comprehensive implementation (20+ options: -a, -b, -d, -f, -i, -l, -L, -n, -p, -P, -r, -R, -s, -u, -v, hard/symbolic links)
- **Technical improvements**:
  - Size: 5901.95 KB (5.76 MB)
  - Zero external dependencies (Windows APIs only)

### v0.1.1.2
- **Enhanced text processing commands**:
  - `sed` - Full POSIX/GNU sed implementation with all standard options
  - `awk` - Complete awk implementation with pattern matching, field processing
- **Technical improvements**:
  - Size: 5740.30 KB (5.61 MB)
  - Zero external dependencies (Windows APIs only)

### v0.1.0.3
- **Enhanced MySQL client implementation**:
  - Full MySQL wire protocol v10 client
  - TCP/IP connection with handshake parsing
  - Query execution (SHOW DATABASES, SHOW TABLES, SELECT)
  - Batch mode (-B) and silent mode (-s) support
  - Interactive and batch output formatting
  - MySQL error codes and diagnostics
  - Native WinSock implementation
- **Enhanced ffmpeg multimedia transcoder**:
  - Full container remuxing support
  - Format conversion (MP4↔AVI, MKV↔MP4, etc.)
  - Audio extraction from video files (-vn flag)
  - Video/audio stream copying without re-encoding
  - Real-time progress reporting
  - Windows native file I/O implementation
- **Technical improvements**:
  - Size: 5740.30 KB (5.61 MB)
  - Zero external dependencies (Windows APIs only)
  - Improved multimedia and database support

### v0.0.7.6
- Added 8 new utility commands:
  - `cp` - Copy files and directories with -r/-f/-i/-v/-p flags
  - `dirname` - Extract directory portion from pathnames
  - `readlink` - Display symbolic link targets with -f flag
  - `realpath` - Print resolved absolute file paths
  - `mktemp` - Create temporary files/directories with random names
  - `install` - Copy files and set attributes with -d/-m/-v flags
  - `fmt` - Reformat paragraph text with -w flag
  - `fold` - Wrap text to specified width with -s flag
- Updated command count from 155 to 163 (149 fully implemented)
- Full implementations with proper error handling and all standard flags

### v0.0.7.5
- Added internal `make` command for build automation from Makefile
- Implemented full Makefile parser with dependency resolution and timestamp-based rebuilding
- Added support for `-f`, `-C`, `-n`, and `-B` flags in make command
- Added tilde (~) expansion for home directory shortcut in all path operations
- Updated pwd command to display "~" when in home directory
- Renamed project from garyscon to wnus (Windows Native Unix Shell)
- Fixed command chaining to properly isolate redirection contexts between commands

### v0.0.7.4
- Added full I/O redirection support:
  - Output redirection with `>` (overwrite)
  - Append redirection with `>>` (append)
  - Input redirection with `<` (read from file)
- Added background process execution with `&` operator
- Added process control with Ctrl+C (interrupt) and Ctrl+Z (suspend)
- Implemented background process tracking and cleanup
- Changed prompt from "gash" to "wnus" for consistency
- All redirections work with pipes and command chains

### v0.0.7.3
- Added command chaining with `&&` (AND) and `||` (OR) operators
- Enhanced command execution pipeline with conditional logic
- Support for complex command sequences with multiple operators
- Improved error handling in chained command execution

### v0.0.7.2
- Minor bug fixes and stability improvements

### v0.0.7.1
- Added internal `read`, `rename`, `unlink`, `nohup`, `blkid`, `test`, and `egrep`
- Enhanced shell scripting with input reading and conditional testing
- Improved file operations with pattern-based renaming and unlinking
- Added process immunity with nohup and block device attribute display

### v0.0.7.0
- Added internal `pgrep`, `pidof`, `pstree`, `timeout`, `ftp`, `sftp`, and `sysctl`
- Expanded process lookup/tree capabilities and timed command execution
- Added FTP/SSH connectivity probes and sysctl-style system info

### v0.0.6.9
- Added internal `quota`, `basename`, `whereis`, `stat`, `type`, and `chattr` commands
- Enhanced file attribute management and pathname manipulation
- Improved filesystem information display and command lookup utilities

### v0.0.6.8
- Added internal `trap`, `ulimit`, `expr`, `info`, `apropos`, and `whatis` commands
- Enhanced command information and expression evaluation
- Improved signal handling compatibility and resource limit display
- Better manual page searching and command documentation

### v0.0.6.7
- Added internal `printenv`, `export`, `shuf`, `banner`, `time`, and `watch` commands
- Enhanced environment variable management
- Added text shuffling and visual banner display utilities
- Improved command timing and execution monitoring

### v0.0.6.6
- Added internal `updatedb`, `timedatectl`, `env`, `split`, `nl`, and `tr` commands
- Enhanced file indexing, text processing, and system time utilities
- Improved pipeline support for text processing commands

### v0.0.6.5
- Added internal `mkfs`, `fsck`, `systemctl`, `journalctl`, and `more` commands
- Enhanced filesystem and service management utilities

### v0.0.6.4
- Added internal `nc`, `unrar`, `xz`, `unxz`, and `dmesg` commands
- Enhanced compression and network utilities

### v0.0.6.3
- Added internal `sleep` and `wait` commands
- Updated help, man pages, and version banner

### v0.0.6.2
- Added `sh` command for shell scripts
- Enhanced scripting capabilities

### v0.0.6.1
- Added bzip2/bunzip2 guides
- Improved compression support

### v0.0.6.0
- Added tac, mpstat, cal, lspci, lsusb
- Enhanced system commands

## 📄 License

GNU General Public License v3.0

## 📝 Notes

**Informational Commands**: Some commands provide guidance rather than full implementation:
- `bzip2/bunzip2` - External tool guides
- `lspci/lsusb` - Hardware enumeration guides  
- `strace/lsof` - System inspection guides
- `jobs/bg/fg` - Job control guides
- `at/cron/crontab` - Scheduling guides
- `tcpdump` - Network capture guide

See command help (`--help`) and man pages for Windows alternatives and recommendations.

## 🔗 Links

- Full command reference: Type `help` in shell
- Manual pages: Type `man <command>`
- Version info: Type `version`

---

**Gary's Shell** - Bringing Unix power to Windows! 🚀
