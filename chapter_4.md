# Manipulating Files and Directory

**Wildcards**
|Wildcard|Meaning|
|-|-|
|`*`|Matches any characters|
|`?`|Matches any single character|
|`[characters]`|Matches any character that is a member of the set characters|
|`[!characters]`|Matches any character that is not a member of the set characters|
|`[[:class:]]`| Matches any character that is a member of the specified class|
<br />
- Common classes

|Class|Meaning|
|-|-|
|`[:alnum:]`|Matches any alphanumeric character
|`[:alpha:]`|Matches any alphabetic character
|`[:digit:]`|Matches any numeral
|`[:lower:]`|Matches any lowercase letter
|`[:upper:]`|Matches any uppercase letter
<br />

**Create Directories**
```sh
admin  Lynn ~ ∫ mkdir directory...
```

Example
```sh
admin  Lynn ~ ∫ mkdir dir1
```
```sh
admin  Lynn ~ ∫ mkdir dir1 dir2 dir3
```
<br />

**Copy Files and Directories**
```sh
admin  Lynn ~ ∫ cp item1 item2
```
```sh
admin  Lynn ~ ∫ cp items... directory
```
Options
|Option|Long Option|Meaning|
|-|-|-|
|`-a`| `--archive`| Copy the files and directories and all of their attributes, including ownerships and permissions. Normally, copies take on the default attributes of the user performing the copy.
|`-i`| `--interactive`| Before overwriting an existing file, prompt the user for confirmation. If this option is not specified, `cp` will silently (meaning there will be no warning) overwrite files.
|`-r`| `--recursive`| Recursively copy directories and their contents. This option (or the `-a` option) is required when copying directories.
|`-u`| `--update`| When copying files from one directory to another, only copy files that either don't exist or are newer than the existing corresponding files, in the destination directory. This is useful when copying large numbers of files as it skips files that don't need to be copied.
|`-v`| `--verbose`| Display informative messages as the copy is performed.

Example
|Command|Resuls|
|-|-|
|`cp file1 file2`| Copy file1 to file2. If file2 exists, it is overwritten with the contents of file1. If file2 does not exist, it is created.
|`cp -i file1 file2`| Same as previous command, except that if file2 exists, the user is prompted before it is overwritten.
|`cp file1 file2 dir1`| Copy file1 and file2 into directory dir1. The directory dir1 must already exist.
|`cp dir1/* dir2`| Using a wildcard, copy all the files in dir1 into dir2. The directory dir2 must already exist.
|`cp -r dir1 dir2`| Copy the contents of directory dir1 to directory dir2. If directory dir2 does not exist, it is created and, after the copy, will contain the same contents as directory dir1. If directory dir2 does exist, then directory dir1 (and its contents) will be copied into dir2. 
<br />

**Move and Rename Files**
```sh
admin  Lynn ~ ∫ mv item1 item2
```
```sh
admin  Lynn ~ ∫ mv items... directory
```

Options
|Option|Long Option|Meaning|
|-|-|-|
|`-i`| `--interactive`| Before overwriting an existing file, prompt the user for confirmation. If this option is not specified, `mv` will silently overwrite files.
|`-u`| `--update`| When moving files from one directory to another, only move files that either don't exist, or are newer than the existing corresponding files in the destination directory.
|`-v`| `--verbose`| Display informative messages as the move is performed.

Example
|Command| Results|
|-|-|
|`mv file1 file2`| Move file1 to file2. If file2 exists, it is overwritten with the contents of file1. If file2 does not exist, it is created. In either case, file1 ceases to exist.
|`mv -i file1 file2`| Same as the previous command, except that if file2 exists, the user is prompted before it is overwritten.
|`mv file1 file2 dir1`| Move file1 and file2 into directory dir1. The dierctory dir1 must already exist.
|`mv dir1 dir2`| If directory dir2 does not exist, create directory dir2 and move the contents of directory dir1 into dir2 and delete directory dir1.If directory dir2 does exist, move directory dir1 (and its contents) into directory dir2.
<br />

**Remove Files and Directories**
```sh
admin  Lynn ~ ∫  rm items...
```
Options
|Option| Long Option| Meaning|
|-|-|-|
|`-i`| `--interactive`| Before deleting an existing file, prompt the user for confirmation. If this option is not specified, `rm` will silently delete files.
|`-r`| `--recursive`| Recursively delete directories. This means that if a directory being deleted has subdirectories, delete them too. To delete a directory, this option must be specified.
|`-f`| `--force`| Ignore nonexistent files and do not prompt. This overrides the `--interactive` option. 
|`-v`| `--verbose`| Display informative messages as the deletion is performed.

Example
|Command|Resuls|
|-|-|
|`rm file1`| Delete file1 silently.
|`rm -i file1`| Same as the previous command, except that the user is prompted for confirmation before the deletion is performed.
|`rm -r file1 dir1`| Delete file1 and dir1 and its contents.
|`rm -rf file1 dir1`| Same as the previous command, except that if either file1 or dir1 do not exist, rm will continue silently.
<br />

**Create Links**
- Hard link
```sh
admin  Lynn ~ ∫ ln file link
```
- Symbolic link
```sh
admin  Lynn ~ ∫ ln -s item link
```
where `item` is a text description of where the target file is **relative** to the symbolic link
```sh
admin  Lynn ~ ∫ ln -s path link
```
`path` can also be **absolute**
<br />