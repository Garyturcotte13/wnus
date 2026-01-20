# Windows Native Unix Shell (wnus) - Version 0.0.8.1

A comprehensive Unix/Linux-like shell environment for Windows, implemented entirely in C++ without external dependencies. Windows Native Unix Shell brings the power and familiarity of bash commands to native Windows, with full NTFS support and Windows API integration.

[![Platform](https://img.shields.io/badge/platform-Windows-blue.svg)](https://www.microsoft.com/windows)
[![Build](https://img.shields.io/badge/build-passing-brightgreen.svg)](.)
[![Version](https://img.shields.io/badge/version-0.0.8.1-orange.svg)](.)

## 🌟 Overview

**Windows Native Unix Shell (wnus)** is a standalone bash-like console application for Windows that provides:
- **262+ commands** with 246+ fully implemented and 16+ informational guides
- **Native Windows integration** using NTFS file system and Windows APIs
- **No external dependencies** - no WSL, Git Bash, Cygwin, or other installations required
- **Full bash compatibility** for common command-line workflows including I/O redirection and process control
- **Comprehensive documentation** with man pages for every command

## ✨ Key Features

### Core Capabilities
- 🔧 **246+ Unix/Linux commands** implemented natively in C++
- 📁 **Native NTFS support** with Windows ACL integration
- 🔀 **Full pipe operations** (`|`) for command chaining
- 🔗 **Command chaining** with `&&` (AND) and `||` (OR) operators
- 📤 **I/O redirection** with `>`, `>>`, and `<` operators
- 🚀 **Background processes** with `&` operator
- ⌨️ **Interactive tab completion** for commands and file paths
- 📜 **Persistent command history** with search capabilities
- 🔖 **Configurable command aliases** for personalized workflows
- 📖 **Comprehensive man page system** for detailed command documentation
- ❓ **Context-sensitive help** (`--help` flag for all commands)
- 🛑 **Process control** with Ctrl+C (terminate) and Ctrl+Z (suspend)

### Advanced Features
- 🔐 **Windows ACL integration** via chmod, chown, chgrp
- 🔗 **Hard and symbolic links** with native NTFS support
- 🌐 **Network operations** including SSH, SCP, rsync, wget, curl
- 📦 **Archive management** with tar, gzip, zip support
- 💻 **Process management** with ps, top, kill, nice commands
- 👥 **User/group management** with Windows account integration
- 🔄 **Service control** for Windows services
- 🚀 **Shell scripting** with sh command and source support
- 🧮 **Built-in calculators** (bc, calc, qalc)

## 🚀 Quick Start

### Prerequisites
- Windows 7 or later (Windows 10/11 recommended)
- C++ compiler (MSVC, MinGW, or Clang)

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
- `chmod`, `chown`, `chgrp` - Permission management
- `dd` - Low-level file copy
- `file`, `blkid` - File/device information

### Text Processing (21 commands)
- `grep`, `egrep`, `sed`, `awk` - Pattern matching and text processing
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
- `find` - Find files/directories
- `locate` - Recursive search
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
- `mesg`, `write`, `wall` - Local messaging controls

### Process Management (23 commands)
- `ps`, `proc`, `htop`, `top` - Process viewing
- `pgrep`, `pidof`, `pstree` - Process lookup and tree display
- `kill`, `killall`, `pkill`, `xkill` - Process termination
- `nice`, `renice` - Priority management
- `jobs`, `bg`, `fg` - Job control (info guides)
- `strace`, `lsof` - Debugging (info guides)
- `sleep`, `wait`, `timeout`, `nohup` - Delays and timed execution

### Archives & Compression (11 commands)
- `tar` - Archive management
- `gzip/gunzip` - Gzip compression
- `zip/unzip` - ZIP archives
- `bzip2/bunzip2` - Bzip2 (info guides)
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
- `ssh`, `scp`, `rsync` - Remote access
- `ftp`, `sftp` - Connectivity probes for FTP and SSH/SFTP
- `wget`, `curl` - File downloads
- `ping`, `traceroute` - Diagnostics
- `ip`, `ifconfig`, `iptables` - Network config
- `dig`, `nslookup`, `netstat`, `ss` - Network info
- `nmap`, `tcpdump`, `lspci`, `lsusb` - Network/hardware tools
Tip: For a quick FTP connectivity check, use `ftp -u anonymous -w anonymous@ test.rebex.net` (public read-only server).

### Services & System (5 commands)
- `service` - Windows service control
- `shutdown`, `reboot` - Power management
- `sync` - File system sync

### Shell & Scripting (21 commands)
- `sh`, `source`, `exec` - Script execution
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

### Editing & Display (3 commands)
- `nano` - Text editor
- `clear` - Clear screen
- `screen` - Terminal multiplexer (limited)

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
- **Memory**: ~5-10 MB
- **Size**: ~4.4 MB executable

## 🔄 Version History

### v0.0.7.6 (Current)
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
