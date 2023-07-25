# Exploring the System

**More fun with ls**
- ls directory with /path
```sh
admin  Lynn ~ ∫ ls /path
dir1		dir2		dir3		dir4
dir5		dir6		dir7		dir8
```
<br />

- ls with multiple paths
```sh
admin  Lynn ~ ∫ ls /path1 /path2
/path1:
dir1		dir2		dir3		dir4
dir5		dir6		dir7		dir8

/path2:
dir9		dir10		dir11		dir12
dir13		dir14		dir15		dir16
```sh
<br />

**Options and Arguments**
```sh
admin  Lynn ~ ∫ command -options arguments
```
<br />

**Option**
```sh
admin  Lynn ~ ∫ command -option
```
- Long option
```sh
admin  Lynn ~ ∫ command --option
```
- Multiple options
```sh
admin  Lynn ~ ∫ command -option1 -option2
```
```sh
admin  Lynn ~ ∫ command -option1option2
```
<br />

**Common ls options**
|Option|Long Option|Description|
|---|---|---|
|`-a`|`--all`|List all files, even those with names that begin with a period, which are normally not listed (that is, hidden).|
|`-A`|`--almost-all`|ike the `-a` option above except it does not list . (current directory) and .. (parent directory).|
|`-d`|`--directory`|Ordinarily, if a directory is specified, ls will list the contents of the directory, not the directory itself. Use this option in conjunctionwith the -l option to see details about the directory rather than its contents.|
|`-F`|`--classify`|This option will append an indicator characterto the end of each listed name. For example, aforward slash (/) if the name is a directory. |
|`-h`|`--human-readable`|In long format listings, display file sizes in human readable format rather than in bytes.|
|`-l`||Display results in long format.|
|`-r`|`--reverse`|Display the results in reverse order. Normally,ls displays its results in ascending alphabetical order.|
|`-S`||Sort results by file size.|
|`-t`||Sort by modification time.|
<br />

**Long format**
```sh
admin  Lynn ~ ∫ ls -l
total 1960
-rw-r--r--    1 admin  staff      77 Sep 25  2021 hello.cpp
drwxr-xrwx   12 admin  staff     384 Jul  5 00:02 Applications
drwxr-xr-x@  57 admin  staff    1824 Jul 24 22:19 Desktop
...
```
|Field|Meaning|
|-|-|
|-rw-r--r--|Access rights to the file. The first character indicates the type of file. Among the different types, a leading dash means a regular file, while a “d” indicates a directory. The next three characters are the access rights for the file's owner, the next three are for members of the file's group, and the final three are for everyone else.|
|1|File's number of hard links.|
|admin|The username of the file's owner.|
|staff|The name of the group that owns the file.|
|77|Size of the file in bytes.|
|Sep 25  2021|Date and time of the file's last modification.|
|hello.cpp|Name of the file.|
<br />

**Determining File's type**
```sh
admin  Lynn ~ ∫ file filename
```
Example
```sh
admin  Lynn ~ ∫ file Untitled.txt
Untitled.txt: Unicode text, UTF-16, little-endian text
```
<br />

**Viewing file's content**
```sh
admin  Lynn ~ ∫ less filename
```
While viewing
|Command|Action|
|-|-|
|<kbd>Page Up</kbd> or <kbd>b</kbd>|Scroll back one page|
|<kbd>Page Down</kbd> or <kbd>space</kbd>|Scroll forward one page|
|<kbd>↑</kbd>|Scroll up one line|
|<kbd>↓</kbd>|Scroll down one line|
|<kbd>G</kbd>|Move to the end of the text file|
|<kbd>1</kbd><kbd>G</kbd> or <kbd>g</kbd>|Move to the beginning of the text file|
|<kbd>/</kbd>characters|Search forward to the next occurrence of characters|
|<kbd>n</kbd>|Search for the next occurrence of the previous search|
|<kbd>h</kbd>|Display help screen|
|<kbd>q</kbd>|Quit `less`|