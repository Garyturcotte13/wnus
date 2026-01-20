# Windows Native Unix Shell (wnus) User Manual
## Version 0.0.8.2

---

## Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Getting Started](#getting-started)
4. [Command Line Interface](#command-line-interface)
5. [Command Reference](#command-reference)
6. [Advanced Features](#advanced-features)
7. [Shell Scripting](#shell-scripting)
8. [System Administration](#system-administration)
9. [Network Operations](#network-operations)
10. [Troubleshooting](#troubleshooting)
11. [Appendix](#appendix)

---

## 1. Introduction

### What is Windows Native Unix Shell?

Windows Native Unix Shell (wnus) is a comprehensive Unix/Linux-like command-line shell for Windows. It provides over 246 Unix/Linux commands implemented natively in C++,
allowing Windows users to enjoy the power and flexibility of Unix command-line tools without requiring WSL, Git Bash, Cygwin, or any other third-party installations.

### Key Benefits

- **Native Windows Integration**: Full NTFS file system support with Windows ACL integration
- **No Dependencies**: Single executable with no external requirements
- **Comprehensive**: 262+ commands covering file operations, text processing, networking, and system administration
- **Well Documented**: Every command includes `--help` text and full man pages
- **Familiar Interface**: Bash-like syntax and behavior for easy adoption

### System Requirements

- **Operating System**: Windows 7 or later (Windows 10/11 recommended)
- **Memory**: 15 MB RAM minimum, 32 MB recommended
- **Disk Space**: 5-6 MB for executable
- **Privileges**: Standard user for most commands, Administrator for system operations

---

## 2. Installation

### Building from Source

#### Method 1: Using PowerShell Build Script (Recommended)

```powershell
# Navigate to source directory
cd C:\path\to\garysconsole

# Run build script
.\build.ps1
```

The script will:
- Compile using MSVC compiler
- Link required Windows libraries
- Generate `wnus.exe` in the current directory
- Display build statistics

#### Method 2: Using CMake

```bash
# Create build directory
mkdir build
cd build

# Configure with CMake
cmake ..

# Build
cmake --build . --config Release

# Executable will be in build/Release/wnus.exe
```

#### Method 3: Manual Compilation with MSVC

```cmd
cl /EHsc /O2 garyscon.cpp /Fe:wnus.exe ^
   user32.lib shell32.lib advapi32.lib ^
   ws2_32.lib iphlpapi.lib netapi32.lib
```

#### Method 4: Using MinGW

```bash
g++ -O2 -o wnus.exe garyscon.cpp ^
    -luser32 -lshell32 -ladvapi32 ^
    -lws2_32 -liphlpapi -lnetapi32 -static
```

### Installation

After building, you can:

1. **Run from current directory**:
   ```cmd
   wnus.exe
   ```

2. **Add to PATH** (for system-wide access):
   ```cmd
   # Copy to a directory in PATH, e.g.:
   copy wnus.exe C:\Windows\System32\
   ```

3. **Create shortcut**:
   - Right-click on desktop
   - New → Shortcut
   - Browse to `wnus.exe`
   - Name it "Windows Native Unix Shell"

---

## 3. Getting Started

### Launching the Shell

#### Interactive Mode

Double-click `wnus.exe` or run from command prompt:
```cmd
wnus.exe
```

You'll see:
```
Windows Native Unix Shell (wnus) v0.0.7.2 - Native Unix Environment for Windows
Type 'help' for available commands
Type 'version' for more information
Type 'exit' or 'quit' to close
-----------------------------------------

C:/current/directory$
```

#### Single Command Mode

Execute a single command and exit:
```cmd
wnus.exe -c "ls -la"
wnus.exe -c "pwd"
wnus.exe -c "grep error logfile.txt"
```

### Basic Navigation

```bash
# Show current directory
pwd

# List files in current directory
ls

# List files with details
ls -l

# List all files including hidden
ls -la

# Change directory
cd Documents
cd C:/Windows
cd ..          # Parent directory
cd ~           # Home directory
cd             # Home directory (no argument)

# Show directory contents with details
ls -la
```

### Getting Help

```bash
# List all available commands
help

# Get help for a specific command
ls --help
grep --help
ssh --help

# Read full manual page
man ls
man grep
man ssh

# Show version and feature list
version
```

### Basic File Operations

```bash
# Create empty file
touch newfile.txt

# Create directory
mkdir newfolder

# Copy file (using system command)
cp source.txt destination.txt

# Move/rename file
mv oldname.txt newname.txt

# Delete file
rm unwanted.txt

# Delete directory
rmdir emptyfolder
rmdir -rf folder_with_contents

# View file contents
cat file.txt
less largefile.log
head file.txt
tail -n 20 file.txt
```

### Exiting

```bash
exit
# or
quit
# or press Ctrl+C
```

---

## 4. Command Line Interface

### Command Syntax

```
command [options] [arguments]
```

Example:
```bash
ls -la /path/to/directory
│  │   └─ Argument
│  └───── Options/flags
└──────── Command
```

### Options and Flags

Most commands support options in two formats:

1. **Short format**: Single dash with single letter
   ```bash
   ls -l
   grep -i pattern file.txt
   tar -czf archive.tar.gz folder/
   ```

2. **Long format**: Double dash with full word
   ```bash
   grep --help
   ls --all
   ```

3. **Combined short options**:
   ```bash
   ls -la      # Same as: ls -l -a
   tar -czf    # Same as: tar -c -z -f
   ```

### Argument Types

#### File Paths
```bash
# Absolute paths
cat C:/Windows/System32/drivers/etc/hosts
cat /c/Users/username/file.txt

# Relative paths
cat ../parent_folder/file.txt
cat ./subfolder/file.txt

# Home directory
cat ~/Documents/file.txt
```

#### Wildcards (Globbing)
```bash
# Match any characters
ls *.txt
rm temp*

# Match single character
ls file?.txt

# Multiple files
cat file1.txt file2.txt file3.txt
```

#### Special Characters

- `~` - Home directory
- `.` - Current directory
- `..` - Parent directory
- `*` - Wildcard (any characters)
- `?` - Wildcard (single character)
- `|` - Pipe output to next command
- `>` - Redirect output to file (via system)
- `<` - Redirect input from file (via system)

### Piping

Chain commands using the pipe operator:

```bash
# Basic piping
ls -la | grep ".txt"

# Multiple pipes
cat logfile.txt | grep "ERROR" | sort | uniq

# Process output
ps | grep chrome

# Count filtered results
ls | grep ".cpp" | wc -l

# Complex filtering
find . -name "*.log" | xargs grep "error"
```

### Tab Completion

Press `Tab` to auto-complete:

```bash
# Complete command names
gre<Tab>     # → grep

# Complete file names
cat doc<Tab>  # → cat document.txt

# Complete directory names
cd Do<Tab>    # → cd Documents/
```

Press `Tab` multiple times to cycle through matches.

### Command History

Navigate through previous commands:

- **Up Arrow**: Previous command
- **Down Arrow**: Next command
- **Page Up**: Jump back in history
- **Page Down**: Jump forward in history

View and manage history:
```bash
# Show all history
history

# Show last 20 commands
history 20

# Clear history
history -c
```

### Aliases

Create shortcuts for frequently used commands:

```bash
# Create alias
alias ll="ls -la"
alias ..="cd .."
alias gs="git status"
alias update="apt-get update && apt-get upgrade"

# Use alias
ll              # Executes: ls -la

# List all aliases
alias

# Remove alias
unalias ll
```

Aliases persist only for the current session.

---

## 5. Command Reference

### Navigation & File Viewing

#### pwd - Print Working Directory
```bash
# Show current directory path
pwd

# Output example:
C:/Users/username/Documents
```

#### cd - Change Directory
```bash
# Change to specific directory
cd C:/Windows
cd /Users/username/Documents

# Navigate relatively
cd ..                  # Parent directory
cd ../..               # Two levels up
cd subfolder           # Child directory

# Go to home directory
cd ~
cd                     # No argument also goes home

# Previous directory
cd -                   # (via PATH/system)
```

#### ls - List Directory Contents
```bash
# Basic listing
ls

# Long format with details
ls -l

# Show all files (including hidden)
ls -a

# Long format + all files
ls -la

# List specific directory
ls /path/to/directory

# List specific files
ls *.txt
```

Output format for `ls -l`:
```
-rw-r--r--  1234 01/19/2026 10:30 filename.txt
│           │    │           │     └─ Name
│           │    │           └─────── Time
│           │    └─────────────────── Date
│           └──────────────────────── Size (bytes)
└──────────────────────────────────── Permissions
```

#### cat - Concatenate and Display Files
```bash
# Display single file
cat file.txt

# Display multiple files
cat file1.txt file2.txt file3.txt

# Display with line numbers (via grep)
cat file.txt | grep -n ".*"
```

#### less - View File with Paging
```bash
# View large file
less largefile.log

# Controls:
# Space    - Next page
# b        - Previous page
# q        - Quit
# /pattern - Search forward
# ?pattern - Search backward
# n        - Next match
# N        - Previous match
```

#### head - Display First Lines
```bash
# First 10 lines (default)
head file.txt

# First 20 lines
head -n 20 file.txt

# First 5 lines
head -5 file.txt
```

#### tail - Display Last Lines
```bash
# Last 10 lines (default)
tail file.txt

# Last 50 lines
tail -n 50 file.txt

# Last 5 lines
tail -5 file.txt
```

#### tac - Reverse Line Order
```bash
# Display file in reverse line order
tac file.txt

# Reverse multiple files
tac file1.txt file2.txt
```

### File Operations

#### touch - Create/Update Files
```bash
# Create empty file
touch newfile.txt

# Create multiple files
touch file1.txt file2.txt file3.txt

# Update timestamp of existing file
touch existingfile.txt
```

#### mkdir - Make Directory
```bash
# Create single directory
mkdir newfolder

# Create nested directories
mkdir -p parent/child/grandchild

# Create multiple directories
mkdir dir1 dir2 dir3
```

#### rm - Remove Files
```bash
# Remove single file (with confirmation)
rm file.txt

# Force remove without confirmation
rm -f file.txt

# Remove multiple files
rm file1.txt file2.txt file3.txt

# Remove with pattern
rm *.tmp
rm temp*
```

#### rmdir - Remove Directory
```bash
# Remove empty directory
rmdir emptyfolder

# Remove directory and contents recursively
rmdir -rf folder_with_files

# Force remove without confirmation
rmdir -f folder
```

#### mv - Move/Rename
```bash
# Rename file
mv oldname.txt newname.txt

# Move file to directory
mv file.txt /path/to/destination/

# Move multiple files
mv file1.txt file2.txt destination_folder/

# Move directory
mv oldfolder newfolder
```

#### ln - Create Links
```bash
# Create hard link
ln target.txt hardlink.txt

# Create symbolic link (symlink)
ln -s target.txt symlink.txt

# Create link to directory
ln -s /path/to/source /path/to/link
```

**Note**: Symlinks require Administrator privileges on Windows.

#### chmod - Change Permissions
```bash
# Set permissions (Windows ACL)
chmod 755 file.txt
chmod 644 document.doc

# Common permission codes:
# 755 - rwxr-xr-x (Owner: full, Others: read+execute)
# 644 - rw-r--r-- (Owner: read+write, Others: read-only)
# 777 - rwxrwxrwx (Full access for all)
# 600 - rw------- (Owner only)
```

#### chown - Change Owner
```bash
# Change file owner (requires Administrator)
sudo chown username file.txt

# Change owner of directory
sudo chown username folder/
```

#### chgrp - Change Group
```bash
# Change file group (requires Administrator)
sudo chgrp groupname file.txt
```

#### file - Determine File Type
```bash
# Check file type
file document.doc
file image.png
file unknown_file

# Output examples:
# document.doc: Microsoft Word document
# image.png: PNG image data
# script.sh: ASCII text
```

### Text Processing

#### grep - Search Pattern in Files
```bash
# Basic search
grep "pattern" file.txt

# Case-insensitive search
grep -i "pattern" file.txt

# Show line numbers
grep -n "pattern" file.txt

# Invert match (lines NOT containing pattern)
grep -v "pattern" file.txt

# Search multiple files
grep "error" *.log

# Search recursively (via find)
find . -type f | xargs grep "pattern"

# Combined options
grep -in "error" file.txt    # Ignore case + line numbers
```

#### sed - Stream Editor
```bash
# Substitute text (first occurrence per line)
sed 's/old/new/' file.txt

# Substitute globally (all occurrences)
sed 's/old/new/g' file.txt

# Delete lines matching pattern
sed '/pattern/d' file.txt

# Print only matching lines
sed -n '/pattern/p' file.txt
```

#### awk - Pattern Scanning
```bash
# Print first column
awk '{print $1}' file.txt

# Print first and third columns
awk '{print $1, $3}' file.txt

# Print lines where first column > 100
awk '$1 > 100' file.txt

# Sum values in first column
awk '{sum+=$1} END {print sum}' file.txt

# Custom delimiter
awk -F',' '{print $1}' data.csv
```

#### sort - Sort Lines
```bash
# Sort alphabetically
sort file.txt

# Sort numerically
sort -n numbers.txt

# Sort in reverse
sort -r file.txt

# Sort by specific column
sort -k2 file.txt

# Remove duplicates while sorting
sort -u file.txt
```

#### cut - Extract Columns
```bash
# Cut by character position
cut -c1-10 file.txt         # Characters 1-10

# Cut by delimiter (comma)
cut -d',' -f1 data.csv      # First field
cut -d',' -f1,3 data.csv    # Fields 1 and 3

# Cut by tab delimiter
cut -f1,2 data.tsv
```

#### paste - Merge Files
```bash
# Merge files line by line
paste file1.txt file2.txt

# Use custom delimiter
paste -d',' file1.txt file2.txt

# Serial paste (all lines from first file, then second)
paste -s file1.txt file2.txt
```

#### split - Split Files
```bash
# Split by lines (default 1000 lines per file)
split file.txt

# Split with specific line count
split -l 100 file.txt output_

# Split by bytes
split -b 1M largefile.bin chunk_

# Split with numeric suffixes
split -d -l 500 file.txt part_

# Split with size suffixes (K, M, G)
split -b 10K file.txt piece_
```

#### nl - Number Lines
```bash
# Number all lines
nl file.txt

# Number only non-empty lines
nl -ba file.txt

# Custom separator
nl -s ': ' file.txt

# Custom width
nl -w 3 file.txt
```

#### tr - Translate or Delete Characters
```bash
# Convert lowercase to uppercase
echo "hello" | tr 'a-z' 'A-Z'

# Delete characters
echo "hello123" | tr -d '0-9'

# Squeeze repeated characters
echo "heeelllo" | tr -s 'e'

# Translate characters
echo "hello" | tr 'el' 'ip'
```

#### uniq - Remove Duplicate Lines
```bash
# Remove adjacent duplicates
uniq file.txt

# Count occurrences
uniq -c file.txt

# Show only duplicates
uniq -d file.txt

# Show only unique lines
uniq -u file.txt

# Note: Input should be sorted
sort file.txt | uniq
```

#### wc - Count Lines, Words, Characters
```bash
# Count lines, words, characters
wc file.txt

# Count lines only
wc -l file.txt

# Count words only
wc -w file.txt

# Count characters only
wc -c file.txt

# Multiple files
wc *.txt
```

#### diff - Compare Files
```bash
# Show differences
diff file1.txt file2.txt

# Unified format (patch-friendly)
diff -u file1.txt file2.txt

# Brief mode (just report if different)
diff -q file1.txt file2.txt

# Ignore case
diff -i file1.txt file2.txt

# Side-by-side comparison
diff -y file1.txt file2.txt
```

#### patch - Apply Patch File
```bash
# Apply patch
patch file.txt < changes.patch

# Reverse patch
patch -R file.txt < changes.patch

# Dry run (test without applying)
patch --dry-run file.txt < changes.patch
```

#### tee - Copy Input to Files and Stdout
```bash
# Write to file and display
command | tee output.txt

# Append to file
command | tee -a output.txt

# Write to multiple files
command | tee file1.txt file2.txt

# Example: Save and display
ls -la | tee directory_list.txt
```

#### rev - Reverse Text
```bash
# Reverse lines of text
rev file.txt

# Reverse specific text
echo "Hello World" | rev
# Output: dlroW olleH
```

#### echo - Print Text
```bash
# Print simple text
echo "Hello World"

# Print variable (if supported)
echo "Current directory: $(pwd)"

# Print without newline
echo -n "Text without newline"

# Multiple arguments
echo Hello World
```

#### printf - Formatted Output
```bash
# Basic formatting
printf "Hello %s\n" "World"

# Format numbers
printf "Number: %d\n" 42
printf "Float: %.2f\n" 3.14159

# Multiple values
printf "%-10s %5d\n" "Item" 100
```

### File Search

#### find - Find Files and Directories
```bash
# Find all files in current directory
find .

# Find by name
find . -name "*.txt"
find . -name "file?.txt"

# Find by type
find . -type f              # Files only
find . -type d              # Directories only

# Find in specific directory
find /path/to/search -name "*.log"

# Case-insensitive name search
find . -iname "README.*"

# Combined conditions
find . -type f -name "*.txt"
```

#### locate - Fast Pattern Search
```bash
# Search for files by name pattern
locate document
locate "*.pdf"

# Case-insensitive search
locate -i readme

# Show count only
locate -c "*.txt"
```

#### updatedb - Update Locate Database
```bash
# Update database for current directory
updatedb

# Update specific directory
updatedb -U /path/to/directory

# Specify output file
updatedb -o custom_locate.db

# Specify mount point
updatedb -m /mnt/point
```

#### which - Locate Command
```bash
# Find command in PATH
which python
which git
which notepad

# Multiple commands
which python git node
```

### Disk & System Information

#### df - Disk Space Usage
```bash
# Show all drives
df

# Human-readable format
df -h

# Show specific drive
df C:

# Show file system type
df -T
```

Output:
```
Filesystem    Size    Used    Available    Use%
C:            250GB   100GB   150GB        40%
```

#### du - Directory Size
```bash
# Show size of current directory
du

# Human-readable format
du -h

# Summary only
du -s

# Summary for specific directory
du -sh /path/to/directory

# Show sizes for all subdirectories
du -h --max-depth=1
```

#### mount - Show Mounted Volumes
```bash
# List all mounted drives
mount

# Output shows:
# Drive letter, label, file system, size
```

#### uptime - System Uptime
```bash
# Show system uptime
uptime

# Output example:
System uptime: 5 days, 3 hours, 27 minutes
```

#### uname - System Information
```bash
# Show OS name
uname

# Show all information
uname -a

# Show specific info
uname -s          # System name
uname -r          # Release
uname -v          # Version
uname -m          # Machine hardware
```

#### date - Date and Time
```bash
# Show current date/time
date

# Custom format
date +"%Y-%m-%d"              # 2026-01-19
date +"%H:%M:%S"              # 14:30:45
date +"%Y-%m-%d %H:%M:%S"     # 2026-01-19 14:30:45
date +"%A, %B %d, %Y"         # Sunday, January 19, 2026
```

Format codes:
- `%Y` - Year (4-digit)
- `%m` - Month (01-12)
- `%d` - Day (01-31)
- `%H` - Hour (00-23)
- `%M` - Minute (00-59)
- `%S` - Second (00-59)
- `%A` - Weekday name
- `%B` - Month name

#### timedatectl - Time and Date Control
```bash
# Show time and date status
timedatectl

# Display shows:
# - Local time
# - Universal (UTC) time
# - Time zone offset
# - Clock synchronization status (stub)
```

#### cal - Calendar (Sunday First)
```bash
# Current month
cal

# Specific month/year
cal 12 2026          # December 2026
cal 2026             # Full year 2026
```

#### ncal - Calendar (Monday First)
```bash
# Current month
ncal

# Specific month/year
ncal 12 2026
ncal 2026
```

#### free - Memory Usage
```bash
# Show memory usage
free

# Human-readable format
free -h

# Output shows:
# Total, Used, Free memory
```

#### vmstat - Virtual Memory Statistics
```bash
# Show memory statistics
vmstat

# Repeat every 2 seconds
vmstat 2

# Repeat 5 times with 2-second interval
vmstat 2 5
```

#### iostat - I/O Statistics
```bash
# Show I/O statistics
iostat

# Repeat every 2 seconds
iostat 2

# Detailed output
iostat -x
```

#### mpstat - CPU Statistics
```bash
# Show CPU usage (one sample)
mpstat

# Sample every 2 seconds
mpstat 2

# 5 samples at 2-second intervals
mpstat 2 5

# Output shows:
# CPU usage: %user, %system, %idle
```

#### hostname - Show/Set Hostname
```bash
# Show hostname
hostname

# Show IP address
hostname -i

# Set hostname (requires Administrator)
sudo hostname newhostname
```

#### neofetch - System Info Display
```bash
# Show system information with ASCII art
neofetch

# Displays:
# - OS version
# - Hostname
# - Kernel
# - Uptime
# - Memory
# - Shell
# - CPU cores
# - Disk usage
```

### User & Group Management

#### whoami - Current User
```bash
# Show current username
whoami

# Show detailed user information
whoami -all
```

#### who - Logged Users
```bash
# Show logged in users
who

# Show detailed information
who -a
```

#### w - User Activity
```bash
# Show users and their activity
w

# Show specific user
w username
```

#### id - User/Group IDs
```bash
# Show current user ID and groups
id

# Show specific user
id username

# Show only user ID
id -u

# Show only group ID
id -g

# Show all groups
id -G
```

#### finger - User Information
```bash
# Show information about user
finger username

# Show all users
finger
```

#### user - Current User Details
```bash
# Show detailed current user information
user
```

#### groups - User Groups
```bash
# Show groups for current user
groups

# Show groups for specific user
groups username
```

#### passwd - Change Password
```bash
# Change current user's password (requires Administrator)
sudo passwd

# Change another user's password (requires Administrator)
sudo passwd username
```

#### useradd - Add User
```bash
# Add new user (requires Administrator)
sudo useradd newusername

# Add user with home directory
sudo useradd -m newusername

# Add user with specific group
sudo useradd -g groupname newusername
```

#### userdel - Delete User
```bash
# Delete user (requires Administrator)
sudo userdel username

# Delete user and home directory
sudo userdel -r username
```

#### usermod - Modify User
```bash
# Modify user account (requires Administrator)
sudo usermod -g newgroup username

# Add user to supplementary group
sudo usermod -aG groupname username
```

#### groupadd - Create Group
```bash
# Create new group (requires Administrator)
sudo groupadd developers
sudo groupadd admins
```

#### groupmod - Modify Group
```bash
# Modify group (requires Administrator)
sudo groupmod -n newname oldname
```

#### groupdel - Delete Group
```bash
# Delete group (requires Administrator)
sudo groupdel groupname
```

#### getent - Get Entries
```bash
# Get password file entries
getent passwd

# Get specific user
getent passwd username

# Get group entries
getent group

# Get specific group
getent group groupname

# Get hosts entries
getent hosts
```

### Process Management

#### ps / proc - List Processes
```bash
# List all processes
ps
proc          # Alias for ps

# Output shows:
# PID, Process Name, Status, CPU usage, Memory
```

#### top - Interactive Process Viewer
```bash
# Start interactive process monitor
top

# Controls:
# q - Quit
# k - Kill process (enter PID)
# Refreshes automatically
```

#### htop - Enhanced Process Viewer
```bash
# Start enhanced interactive monitor
htop

# Similar to top with enhanced display
```

#### kill - Terminate Process
```bash
# Kill process by PID
kill 1234

# Force kill
kill -9 1234

# Kill multiple processes
kill 1234 5678 9012
```

#### killall - Kill by Name
```bash
# Kill all processes with name
killall chrome.exe
killall notepad.exe

# Force kill
killall -9 process_name
```

#### pkill - Kill by Pattern
```bash
# Kill processes matching pattern
pkill chrome
pkill -9 firefox

# Kill by user
pkill -u username
```

#### xkill - Interactive Kill
```bash
# Launch xkill, then click window to kill
xkill

# Click on any window to terminate its process
```

#### nice - Run with Priority
```bash
# Run with lower priority (nice value 10)
nice -n 10 command

# Run with higher priority (requires Administrator)
sudo nice -n -10 command

# Nice values: -20 (highest) to 19 (lowest)
```

#### renice - Change Priority
```bash
# Change priority of running process
renice 5 1234

# Change priority by user
sudo renice 10 -u username

# Requires Administrator for decreasing nice value
```

### Archives & Compression

#### tar - Archive Management
```bash
# Create archive
tar -cf archive.tar folder/

# Create compressed archive (gzip)
tar -czf archive.tar.gz folder/

# Extract archive
tar -xf archive.tar

# Extract compressed archive
tar -xzf archive.tar.gz

# List archive contents
tar -tf archive.tar

# Extract to specific directory
tar -xf archive.tar -C /destination/

# Add files to existing archive
tar -rf archive.tar newfile.txt

# Options:
# -c: create
# -x: extract
# -t: list
# -f: file
# -z: gzip compression
# -v: verbose
```

#### gzip / gunzip - Gzip Compression
```bash
# Compress file
gzip file.txt
# Creates: file.txt.gz (original removed)

# Decompress file
gunzip file.txt.gz
# Creates: file.txt (archive removed)

# Keep original file
gzip -k file.txt
gunzip -k file.txt.gz

# Compress multiple files
gzip file1.txt file2.txt file3.txt
```

#### zip / unzip - ZIP Archives
```bash
# Create ZIP archive
zip archive.zip file1.txt file2.txt

# Create ZIP with directory
zip -r archive.zip folder/

# Extract ZIP archive
unzip archive.zip

# List ZIP contents
unzip -l archive.zip

# Extract to specific directory
unzip archive.zip -d /destination/

# Update existing ZIP
zip -u archive.zip newfile.txt
```

#### dd - Low-Level Copy
```bash
# Copy file with block size
dd if=source.bin of=destination.bin bs=4096

# Create empty file of specific size
dd if=/dev/zero of=file.bin bs=1M count=10

# Backup disk (use with caution!)
dd if=/dev/sda of=backup.img bs=4M

# Options:
# if=input file
# of=output file
# bs=block size
# count=number of blocks
```

#### make - Build Automation
```bash
# Build default target
make

# Build specific target
make target_name

# Use specific Makefile
make -f Makefile.custom

# Run from different directory
make -C /path/to/project

# Show commands without executing
make -n

# Force rebuild all targets
make -B

# Makefile format:
# target: dependencies
# 	command1
# 	command2
#
# Example Makefile:
# program: main.o utils.o
# 	g++ -o program main.o utils.o
#
# main.o: main.cpp
# 	g++ -c main.cpp
#
# clean:
# 	rm -f *.o program
```

---

## 5. File Utilities

### cp - Copy Files
```bash
# Copy file
cp file1.txt file2.txt

# Copy to directory
cp file.txt /path/to/dir/

# Copy recursively
cp -r dir1 dir2

# Copy with verbose output
cp -v file.txt backup.txt

# Preserve timestamps
cp -p file.txt backup.txt

# Force overwrite
cp -f file.txt existing.txt
```

### dirname - Extract Directory Path
```bash
# Get directory portion
dirname /path/to/file.txt    # Output: /path/to

# Current directory indicator
dirname file.txt             # Output: .

# Handle trailing slashes
dirname /path/to/dir/        # Output: /path/to
```

### readlink - Resolve Symbolic Links
```bash
# Display link target
readlink mylink

# Follow to final target
readlink -f mylink

# No newline output
readlink -n mylink
```

### realpath - Print Absolute Path
```bash
# Get absolute path
realpath file.txt

# Resolve relative paths
realpath ../dir/file

# Current directory
realpath .
```

### mktemp - Create Temporary Files
```bash
# Create temporary file
mktemp

# Create temporary directory
mktemp -d

# With custom template
mktemp tmpfile.XXXXXX

# Dry run (print name only)
mktemp -u

# Use custom prefix directory
mktemp -p C:\Temp file.XXXXXX
```

### install - Copy with Attributes
```bash
# Simple copy
install program /usr/bin/

# Create directories
install -d /path/to/new/dir

# Set permissions
install -m 755 script.sh /usr/local/bin/

# Verbose output
install -v myfile /destination/
```

---

## 6. Text Formatting

### fmt - Reformat Text
```bash
# Reformat to default width (75)
fmt file.txt

# Custom width
fmt -w 60 file.txt

# From stdin
echo "Very long line of text here" | fmt

# Justify paragraphs
cat long_paragraph.txt | fmt -w 70
```

### fold - Wrap Long Lines
```bash
# Wrap to 80 columns
fold file.txt

# Custom width
fold -w 60 file.txt

# Break at spaces
fold -s -w 70 file.txt

# From stdin
echo "Long line here" | fold -w 20
```

---

## 7. Advanced Features

### Piping and Redirection

#### Piping Commands
```bash
# Basic pipe
command1 | command2

# Multiple pipes
command1 | command2 | command3 | command4

# Examples:
ls -la | grep ".txt"
cat log.txt | grep "ERROR" | sort | uniq
ps | grep chrome | awk '{print $1}'
find . -name "*.log" | xargs grep "error"
```

#### Output Redirection (via system)
```bash
# Redirect output to file
command > output.txt

# Append to file
command >> output.txt

# Redirect error output
command 2> error.txt

# Redirect both stdout and stderr
command > output.txt 2>&1
```

### Command Substitution (limited)

```bash
# Some commands support nested execution
echo "Current dir: $(pwd)"
```

### Tab Completion

Windows Native Unix Shell supports intelligent tab completion:

```bash
# Command completion
gre<Tab>      → grep
fin<Tab>      → find

# File/directory completion
cat doc<Tab>  → cat document.txt
cd Des<Tab>   → cd Desktop/

# Multiple matches - press Tab repeatedly to cycle
ls fi<Tab>    → file1.txt → file2.txt → file3.txt
```

### Aliases

Create custom command shortcuts:

```bash
# Define aliases
alias ll="ls -la"
alias gs="git status"
alias update="apt-get update"
alias ..="cd .."
alias ...="cd ../.."

# Use alias
ll                    # Executes: ls -la

# List all aliases
alias

# Remove alias
unalias ll

# Temporary alias (session only)
# Aliases don't persist after shell restart
```

### Command History

Navigate and reuse commands:

```bash
# View history
history               # Show all commands
history 20            # Show last 20 commands

# Navigate history
# Up Arrow    - Previous command
# Down Arrow  - Next command
# PgUp/PgDn  - Jump in history

# Clear history
history -c

# Search history (interactive)
# Ctrl+R - Start reverse search (system shell)
```

### Environment and Path

```bash
# Home directory expansion
cd ~
ls ~/Documents
cat ~/.bashrc

# System PATH
which python          # Find in PATH
which git            # Find in PATH

# Current directory shortcuts
./script.sh          # Execute in current dir
cd ./subfolder       # Navigate to subfolder
ls .                 # List current directory
```

---

## 7. Shell Scripting

### Creating Shell Scripts

#### Basic Script Structure

Create a file `script.sh`:
```bash
#!/bin/sh
# This is a comment

echo "Starting script..."
pwd
ls -la
echo "Script complete!"
```

#### Executing Scripts

```bash
# Method 1: Using sh command
sh script.sh

# Method 2: Using source (executes in current shell)
source script.sh

# Method 3: Make executable and run (via system)
chmod +x script.sh
./script.sh
```

### Script Examples

#### Example 1: Backup Script
```bash
#!/bin/sh
# backup.sh - Simple backup script

echo "Starting backup..."

# Create backup directory
mkdir -p backup

# Create timestamp
timestamp=$(date +"%Y%m%d_%H%M%S")

# Create backup archive
tar -czf backup/backup_${timestamp}.tar.gz data/

echo "Backup complete: backup_${timestamp}.tar.gz"
```

#### Example 2: Log Analysis
```bash
#!/bin/sh
# analyze_logs.sh - Analyze log files

echo "Analyzing logs..."

# Count errors
echo "Error count:"
grep -i "error" *.log | wc -l

# Count warnings
echo "Warning count:"
grep -i "warning" *.log | wc -l

# Show unique errors
echo "Unique errors:"
grep -i "error" *.log | sort | uniq
```

#### Example 3: File Cleanup
```bash
#!/bin/sh
# cleanup.sh - Remove temporary files

echo "Cleaning temporary files..."

# Remove temp files
rm -f *.tmp
rm -f *.bak
rm -f *~

# Remove empty directories
find . -type d -empty -delete

echo "Cleanup complete!"
```

#### Example 4: System Report
```bash
#!/bin/sh
# system_report.sh - Generate system report

echo "=== System Report ==="
echo ""

echo "Date:"
date
echo ""

echo "Hostname:"
hostname
echo ""

echo "Uptime:"
uptime
echo ""

echo "Disk Usage:"
df -h
echo ""

echo "Memory:"
free -h
echo ""

echo "Top Processes:"
ps | head -10
```

### Running Scripts with sh Command

```bash
# Execute script
sh myscript.sh

# Execute with arguments
sh deploy.sh production

# Execute command string
sh -c "echo Hello && pwd && ls"

# Source script in current shell
source myscript.sh
```

### Script Best Practices

1. **Use shebang**: Start with `#!/bin/sh`
2. **Add comments**: Explain what the script does
3. **Check errors**: Verify commands succeed
4. **Use meaningful names**: Clear file and variable names
5. **Test incrementally**: Test each section as you build
6. **Document usage**: Include help message
7. **Handle arguments**: Validate input parameters

### Debugging Scripts

```bash
# Add echo statements
echo "Debug: Processing file $filename"

# Show commands as they execute
# (This would need explicit echo statements in Windows Native Unix Shell)
```

---

## 8. System Administration

### Administrator Privileges

Many system administration tasks require Administrator privileges:

```bash
# Run Windows Native Unix Shell as Administrator
# Right-click wnus.exe → "Run as administrator"

# Or use sudo command
sudo service apache start
sudo useradd newuser
sudo passwd username
```

### User Management

#### Creating Users
```bash
# Add new user
sudo useradd john

# Add user with home directory
sudo useradd -m jane

# Add user to specific group
sudo useradd -g developers mike
```

#### Modifying Users
```bash
# Change user password
sudo passwd username

# Modify user account
sudo usermod -g newgroup username

# Add to supplementary group
sudo usermod -aG admins username

# Change username
sudo usermod -l newname oldname
```

#### Deleting Users
```bash
# Remove user
sudo userdel username

# Remove user and home directory
sudo userdel -r username
```

### Group Management

```bash
# Create group
sudo groupadd developers

# Modify group
sudo groupmod -n new_name old_name

# Delete group
sudo groupdel groupname

# Manage group members
sudo gpasswd -a username groupname    # Add user
sudo gpasswd -d username groupname    # Remove user
```

### Permission Management

```bash
# Change file permissions
chmod 755 script.sh
chmod 644 document.txt

# Change ownership
sudo chown username file.txt
sudo chown username:groupname file.txt

# Change group
sudo chgrp groupname file.txt

# Recursive changes
chmod -R 755 directory/
sudo chown -R user:group directory/
```

Common permission codes:
- `755` - rwxr-xr-x (executable, readable by all)
- `644` - rw-r--r-- (readable by all, writable by owner)
- `700` - rwx------ (owner only)
- `777` - rwxrwxrwx (full access - use with caution!)

### Service Management

```bash
# Start service
sudo service apache start

# Stop service
sudo service apache stop

# Restart service
sudo service apache restart

# Check service status
sudo service apache status

# Common services:
# - apache / httpd (web server)
# - mysql / mssql (database)
# - ssh / sshd (SSH server)
```

### System Power Management

```bash
# Shutdown system
sudo shutdown
sudo shutdown -h now          # Shutdown now
sudo shutdown -h +10          # Shutdown in 10 minutes

# Restart system
sudo reboot
sudo shutdown -r now          # Restart now

# Cancel scheduled shutdown
sudo shutdown -c
```

### File System Operations

```bash
# Flush file system buffers
sync

# Show mounted volumes
mount

# Check disk space
df -h

# Check directory size
du -sh /path/to/directory

# Find large files
find / -type f -size +100M 2>/dev/null
```

### System Monitoring

```bash
# Monitor processes
top                # Interactive monitor
htop               # Enhanced monitor
ps                 # Process snapshot

# Monitor resources
free -h            # Memory usage
mpstat             # CPU statistics
iostat             # I/O statistics
vmstat             # Virtual memory

# Monitor network
netstat -an        # Network connections
ss                 # Socket statistics
```

---

## 9. Network Operations

### SSH - Secure Shell

```bash
# Basic connection
ssh username@hostname

# Connect to specific port
ssh -p 2222 username@hostname

# Connect with key (via external OpenSSH)
ssh -i keyfile username@hostname

# Execute command remotely
ssh username@hostname "ls -la"

# Examples:
ssh john@192.168.1.100
ssh admin@server.example.com
ssh -p 2222 user@example.com
```

**Note**: Uses external OpenSSH client if available, falls back to internal implementation.

### SCP - Secure Copy

```bash
# Copy file to remote
scp localfile.txt user@host:/path/

# Copy from remote
scp user@host:/path/file.txt localfile.txt

# Copy directory recursively
scp -r localdir/ user@host:/path/

# Specify port
scp -P 2222 file.txt user@host:/path/

# Copy between remote hosts
scp user1@host1:/file user2@host2:/path/
```

### rsync - Synchronization

```bash
# Sync directory
rsync -av source/ destination/

# Sync to remote
rsync -av localdir/ user@host:/remotedir/

# Sync from remote
rsync -av user@host:/remotedir/ localdir/

# Delete files not in source
rsync -av --delete source/ destination/

# Dry run (preview changes)
rsync -avn source/ destination/

# Options:
# -a  Archive mode (recursive + preserve)
# -v  Verbose
# -z  Compress during transfer
# -n  Dry run
# --delete  Remove files not in source
# --exclude  Exclude pattern
```

### wget - Download Files

```bash
# Download file
wget https://example.com/file.zip

# Download to specific filename
wget -O newname.zip https://example.com/file.zip

# Continue incomplete download
wget -c https://example.com/largefile.iso

# Download multiple files
wget https://example.com/file1.zip https://example.com/file2.zip

# Quiet mode
wget -q https://example.com/file.zip

# User agent
wget --user-agent="Mozilla/5.0" https://example.com/file.zip
```

### curl - HTTP Client

```bash
# Download file
curl https://example.com/file.txt

# Save to file
curl -O https://example.com/file.txt
curl -o newname.txt https://example.com/file.txt

# Follow redirects
curl -L https://example.com/redirect

# Show headers
curl -I https://example.com/

# POST request
curl -X POST https://api.example.com/data

# POST with data
curl -d "param1=value1&param2=value2" https://api.example.com/

# JSON POST
curl -H "Content-Type: application/json" \
     -d '{"key":"value"}' \
     https://api.example.com/

# Authentication
curl -u username:password https://example.com/

# Custom header
curl -H "Authorization: Bearer token" https://api.example.com/
```

### Network Diagnostics

```bash
# Ping host
ping google.com
ping 8.8.8.8

# Continuous ping
ping -t google.com

# Ping with count
ping -n 10 google.com

# Traceroute
traceroute google.com
traceroute 8.8.8.8

# DNS lookup
dig example.com
dig example.com MX        # Mail records
dig example.com NS        # Name servers

# Alternative DNS lookup
nslookup example.com
nslookup example.com 8.8.8.8    # Use specific DNS server

# Network statistics
netstat -an               # All connections
netstat -an | find "ESTABLISHED"    # Established connections

# Socket statistics
ss -an                    # All sockets
ss -tuln                  # TCP/UDP listening ports

# Network interfaces
ip addr                   # Show interfaces
ipconfig                  # Windows IP config
ifconfig                  # Interface configuration
```

### Firewall Management

```bash
# Show firewall rules
sudo iptables -L

# Show with line numbers
sudo iptables -L -n --line-numbers

# Block port
sudo iptables -A INPUT -p tcp --dport 80 -j DROP

# Allow port
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Delete rule
sudo iptables -D INPUT 1    # Delete rule #1

**Note**: Commands interact with Windows Firewall.
```

### Network Scanning

```bash
# Port scan (informational)
nmap 192.168.1.1
nmap -p 80,443 example.com

# Network scan
nmap 192.168.1.0/24

# Service detection
nmap -sV example.com

**Note**: Provides guidance for using nmap on Windows.
```

### Packet Capture

```bash
# Capture packets (informational guide)
tcpdump -i eth0
tcpdump -i eth0 port 80

**Note**: Provides guidance for using Wireshark or other Windows packet capture tools.
```

---

## 10. Troubleshooting

### Common Issues and Solutions

#### Command Not Found

**Problem**: `command: command not found`

**Solutions**:
1. Verify command spelling:
   ```bash
   help    # List all available commands
   ```

2. Check if it's an internal command:
   ```bash
   which command_name
   ```

3. For external commands, ensure they're in system PATH:
   ```bash
   echo %PATH%    # View PATH
   ```

4. Use full path to executable:
   ```bash
   C:\Path\To\program.exe
   ```

#### File Not Found

**Problem**: `file.txt: No such file or directory`

**Solutions**:
1. Check current directory:
   ```bash
   pwd
   ```

2. Verify file exists:
   ```bash
   ls
   ls -la    # Show hidden files too
   ```

3. Use absolute path:
   ```bash
   cat C:/full/path/to/file.txt
   ```

4. Check file permissions:
   ```bash
   ls -l file.txt
   ```

#### Permission Denied

**Problem**: `Permission denied`

**Solutions**:
1. Run as Administrator:
   - Right-click wnus.exe
   - Select "Run as administrator"

2. Use sudo prefix:
   ```bash
   sudo command
   ```

3. Check file permissions:
   ```bash
   ls -l file.txt
   chmod 755 file.txt    # Make executable
   ```

4. Verify ownership:
   ```bash
   ls -l file.txt
   sudo chown username file.txt
   ```

#### Pipe Not Working

**Problem**: Commands after pipe not executing

**Solutions**:
1. Check each command separately:
   ```bash
   command1
   command2
   ```

2. Verify pipe syntax:
   ```bash
   command1 | command2
   ```

3. Some commands may not support piping in all scenarios

#### Command Hangs/Freezes

**Problem**: Command doesn't return to prompt

**Solutions**:
1. Press Ctrl+C to cancel

2. Check if command is waiting for input

3. For long-running commands, this may be normal:
   ```bash
   less file.txt    # Press q to quit
   top              # Press q to quit
   ```

#### Tab Completion Not Working

**Problem**: Tab key doesn't auto-complete

**Solutions**:
1. Ensure you've typed enough characters to disambiguate:
   ```bash
   gre<Tab>    # Multiple matches? Type more: grep<Tab>
   ```

2. Check if file/command exists:
   ```bash
   ls        # Verify file is there
   help      # Verify command is available
   ```

#### Alias Not Working

**Problem**: Alias doesn't execute

**Solutions**:
1. Verify alias is defined:
   ```bash
   alias          # List all aliases
   ```

2. Define alias if needed:
   ```bash
   alias ll="ls -la"
   ```

3. Remember: Aliases don't persist after restart

#### Network Command Fails

**Problem**: SSH, wget, curl commands fail

**Solutions**:
1. Check network connectivity:
   ```bash
   ping google.com
   ```

2. Verify external tool is installed (for SSH, wget):
   ```bash
   which ssh
   which wget
   ```

3. Check firewall settings

4. Verify hostname/URL is correct

#### Script Doesn't Execute

**Problem**: `sh script.sh` gives errors

**Solutions**:
1. Verify script exists:
   ```bash
   ls script.sh
   ```

2. Check script permissions:
   ```bash
   ls -l script.sh
   chmod 755 script.sh
   ```

3. Check script syntax:
   ```bash
   cat script.sh    # Review contents
   ```

4. Try line-by-line execution to find error

### Getting More Help

#### Command Help
```bash
# Quick help
command --help

# Full manual
man command

# List all commands
help

# Version information
version
```

#### Diagnostic Commands
```bash
# System information
uname -a
neofetch

# Check resources
free -h
df -h

# View processes
ps
top

# Network status
netstat -an
ping google.com
```

#### Log Files

Check system logs for errors:
- Windows Event Viewer
- Application-specific logs
- Network connection logs

---

## 11. Appendix

### A. Command Quick Reference

#### Navigation
```
pwd, cd, ls, cat, less, head, tail, tac
```

#### File Operations
```
touch, mkdir, rm, rmdir, mv, rename, ln, unlink, chmod, chown, chgrp, file, blkid
```

#### Text Processing
```
grep, egrep, sed, awk, sort, cut, paste, uniq, wc, diff, patch, tee, rev, echo, printf
```

#### Search
```
find, locate, which
```

#### System Info
```
df, du, mount, uptime, uname, date, cal, ncal, free, vmstat, iostat, mpstat, hostname, neofetch, sysctl
```

#### Users & Groups
```
whoami, who, w, last, id, finger, user, groups, passwd, useradd, userdel, usermod, groupadd, groupmod, groupdel, gpasswd, getent
```

#### Processes
```
ps, proc, pgrep, pidof, pstree, htop, top, kill, killall, pkill, xkill, nice, renice, jobs, bg, fg, strace, lsof, timeout, nohup
```

#### Archives
```
tar, gzip, gunzip, zip, unzip, bzip2, bunzip2, dd
```

#### Network
```
ssh, scp, rsync, ftp, sftp, wget, curl, ping, traceroute, ip, ifconfig, iptables, dig, nslookup, netstat, ss, nmap, tcpdump, lspci, lsusb
```
Tip: Try `ftp -u anonymous -w anonymous@ test.rebex.net` for a quick public connectivity check (read-only).

#### Services & System
```
service, shutdown, reboot, sync
```

#### Scripting
```
sh, source, exec, echo, printf, bc, calc, qalc, xargs, alias, unalias, history, umask, case, read, test
```

#### Editing & Display
```
nano, clear, screen
```

#### Admin & Help
```
sudo, su, man, help, version, exit, quit
```

### B. Keyboard Shortcuts

```
Ctrl+C          - Cancel current command
Ctrl+D          - Exit shell (EOF)
Ctrl+L          - Clear screen (in some modes)
Up Arrow        - Previous command
Down Arrow      - Next command
Tab             - Auto-complete
Page Up         - Scroll up in history
Page Down       - Scroll down in history
```

### C. Special Characters

```
~               - Home directory
.               - Current directory
..              - Parent directory
*               - Wildcard (any characters)
?               - Wildcard (single character)
|               - Pipe output
>               - Redirect output (system)
<               - Redirect input (system)
>>              - Append output (system)
&               - Background process (system)
;               - Command separator (system)
```

### D. File Permission Codes

```
Code    Permission          Binary    Description
------------------------------------------------------------
0       ---                 000       No permissions
1       --x                 001       Execute only
2       -w-                 010       Write only
3       -wx                 011       Write and execute
4       r--                 100       Read only
5       r-x                 101       Read and execute
6       rw-                 110       Read and write
7       rwx                 111       Read, write, and execute

Common combinations:
755     rwxr-xr-x                     Owner: all, Others: read+execute
644     rw-r--r--                     Owner: read+write, Others: read
700     rwx------                     Owner: all, Others: none
777     rwxrwxrwx                     All: all permissions
```

### E. Date Format Codes

```
Code    Description             Example
-----------------------------------------
%Y      Year (4-digit)          2026
%y      Year (2-digit)          26
%m      Month (01-12)           01
%B      Month name              January
%b      Month abbr              Jan
%d      Day (01-31)             19
%A      Weekday name            Sunday
%a      Weekday abbr            Sun
%H      Hour (00-23)            14
%I      Hour (01-12)            02
%M      Minute (00-59)          30
%S      Second (00-59)          45
%p      AM/PM                   PM
```

### F. Regular Expression Patterns (grep, sed, awk)

```
Pattern     Meaning                         Example
--------------------------------------------------------------
.           Any single character            a.c matches abc, a9c
*           Zero or more of preceding       ab*c matches ac, abc, abbc
[]          Character class                 [aeiou] matches any vowel
[^]         Negated character class         [^0-9] matches non-digit
^           Start of line                   ^The matches "The" at start
$           End of line                     end$ matches "end" at end
\           Escape special character        \. matches literal dot
|           Alternation (or)                cat|dog matches cat or dog
()          Grouping                        (ab)+ matches ab, abab, ababab
```

### G. Useful One-Liners

```bash
# Find large files
find . -type f -size +100M

# Count files in directory
ls | wc -l

# Find duplicate lines
sort file.txt | uniq -d

# Replace text in multiple files
find . -name "*.txt" | xargs sed -i 's/old/new/g'

# Show process tree
ps | sort

# Monitor log file (via tail)
tail -f logfile.txt

# List files by size
ls -lS

# Find recently modified files
find . -mtime -1

# Count word frequency
cat file.txt | tr ' ' '\n' | sort | uniq -c | sort -nr

# Show disk usage by directory
du -h --max-depth=1 | sort -h

# Find files containing text
grep -r "search term" .

# Remove blank lines
grep -v "^$" file.txt

# Extract column from CSV
cut -d',' -f2 data.csv

# Show unique values in column
cut -d',' -f1 data.csv | sort | uniq

# Count lines of code
find . -name "*.cpp" | xargs wc -l
```

### H. ASCII Art Reference

Windows Native Unix Shell uses box-drawing characters in some outputs:

```
╔════╗  ║  ═  ╝  ╚  ╗  ╔
Top-left, vertical, horizontal, bottom-right, bottom-left, top-right, top-left
```

### I. Exit Codes

```
Code    Meaning
----------------------
0       Success
1       General error
2       Misuse of command
126     Command not executable
127     Command not found
130     Terminated by Ctrl+C
```

### J. Related Resources

- **Windows Command Prompt**: Traditional Windows CLI
- **PowerShell**: Advanced Windows shell
- **Windows Subsystem for Linux (WSL)**: Run Linux on Windows
- **Git Bash**: Bash emulation for Windows
- **Cygwin**: Unix-like environment for Windows

### K. Comparison with Other Shells

| Feature              | wnus (Windows Native Unix Shell) | CMD    | PowerShell | Git Bash | WSL    |
|---------------------|--------------|--------|------------|----------|--------|
| Unix Commands        | ✓            | ✗      | Partial    | ✓        | ✓      |
| Windows Integration  | ✓            | ✓      | ✓          | Partial  | Partial|
| No Dependencies      | ✓            | ✓      | ✓          | ✗        | ✗      |
| Man Pages            | ✓            | ✗      | Get-Help   | ✓        | ✓      |
| Pipes                | ✓            | ✓      | ✓          | ✓        | ✓      |
| Tab Completion       | ✓            | ✓      | ✓          | ✓        | ✓      |
| Shell Scripting      | ✓            | ✓      | ✓          | ✓        | ✓      |
| File Size            | 4.4 MB       | Built-in| Built-in  | ~300 MB  | ~1 GB  |

### L. Version History

**v0.0.7.1** (Current)
- Added internal `read`, `rename`, `unlink`, `nohup`, `blkid`, `test`, and `egrep`
- Enhanced shell scripting with input reading and conditional testing
- Improved file operations with pattern-based renaming and unlinking
- Added process immunity with nohup and block device attribute display

**v0.0.7.0**
- Added internal `pgrep`, `pidof`, `pstree`, `timeout`, `ftp`, `sftp`, and `sysctl`
- Expanded process lookup/tree capabilities and timed command execution
- Added connectivity probes for FTP/SSH/SFTP and sysctl-style system info

**v0.0.8.2**
- Implemented virtual root filesystem (wnus:/)
- Added unified drive access via /C, /D, etc. paths
- Changed path format from C:/path to /C/path for consistency
- Added `cd /` to access virtual root with all drives listed
- Enhanced path mapping between Windows and Unix-style paths
- Updated memory requirements and size documentation

**v0.0.8.1**
- Added internal `xdg-open` command for opening files/URLs with default applications
- Uses Windows ShellExecute API for native application association
- Supports files, directories, and URLs (http://, https://, etc.)
- Updated version to 0.0.8.1 with 262+ total commands

**v0.0.6.9**
- Added internal `quota`, `basename`, `whereis`, `stat`, `type`, and `chattr`
- Enhanced file attribute management and pathname manipulation
- Improved filesystem information display and command lookup utilities

**v0.0.6.8**
- Added internal `trap`, `ulimit`, `expr`, `info`, `apropos`, and `whatis`
- Enhanced command information and expression evaluation
- Improved manual page searching and command documentation

**v0.0.6.7**
- Added internal `printenv`, `export`, `shuf`, `banner`, `time`, and `watch`
- Enhanced environment variable management and text utilities

**v0.0.6.6**
- Added internal `updatedb`, `timedatectl`, `env`, `split`, `nl`, and `tr`
- Enhanced file indexing, text processing, and system time utilities

**v0.0.6.5**
- Added internal `mkfs`, `fsck`, `systemctl`, `journalctl`, and `more` commands
- Enhanced filesystem and service management utilities

**v0.0.5.9**
- Added pkill command
- Enhanced process management

---

## Index

For specific command documentation, use:
```bash
man <command>
```

For categorized command listing:
```bash
help
```

For version and feature information:
```bash
version
```

---

**End of Windows Native Unix Shell User Manual**

© 2026 Windows Native Unix Shell (wnus) Project
