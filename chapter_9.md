# Permissions

**Owners, Group Members, and Everybody Else**
Identity's Information
```sh
admin  Lynn ~ ∫ id
```
<br />

**Reading, Writing, and Executing**
```sh
admin  Lynn ~ ∫ ls -l file
-rw-r--r--@ 1 admin  staff   128 Jan 01 00:00 README.md
```
*First 10 characters: File Attributes*
- 1<sup>st</sup> character: File Types:

|Attribute|File Type|
|-|-|
|`-`| A regular file.
|`d`| A directory.
|`l`| A symbolic link. Notice that with symbolic links, the remaining file attributes are always “rwxrwxrwx” and are dummy values. The real file attributes are those of the file the symbolic link points to.
|`c`| A *character special file*. This file type refers to a device that handles data as a stream of bytes, such as a terminal or `/dev/null`.
|`b`| A *block special file*. This file type refers to a device that handles data in blocks, such as a hard drive or DVD drive.

<br />

****
```sh
admin  Lynn ~ ∫ 
```
<br />

****
```sh
admin  Lynn ~ ∫ 
```
<br />

****
```sh
admin  Lynn ~ ∫ 
```
<br />