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

- 2<sup>nd</sup> - 9<sup>th</sup> character: File Mode: 

|Owner|Group|World
|-|-|-
|`rwx`|`rwx`|`rwx`

Permisson Attributes

|Attribute| Files| Directories
|-|-|-
|`r`| Allows a file to be opened and read.| Allows a directory's contents to be listed if the execute attribute is also set.
|`w`| Allows a file to be written to or truncated, however this attribute does not allow files to be renamed or deleted. The ability to delete or rename files is determined by directory attributes.| Allows files within a directory to be created, deleted, and renamed if the execute attribute is also set.
|`x`| Allows a file to be treated as a program and executed. Program files written in scripting languages must also be set as readable to be executed.| Allows a directory to be entered, e.g., cd directory.

<br />

**Change File Mode**
*Only the file’s owner or the superuser can change the mode of a file or directory*

- File Modes in Binary and Octal

```sh
admin  Lynn ~ ∫ chmod [3 octal digits] file
```

|Octal| Binary| File Mode
|-|-|-
|`0`| `000`| `---`
|`1`| `001`| `--x`
|`2`| `010`| `-w-`
|`3`| `011`| `-wx`
|`4`| `100`| `r--`
|`5`| `101`| `r-x`
|`6`| `110`| `rw-`
|`7`| `111`| `rwx`

- Symbolic Notation

```sh
admin  Lynn ~ ∫ chmod [symbol operation permission] file
```

• Who the change will affect

|Symbol| Meaning
|-|-
|`u`| Short for “user” but means the file or directory owner.
|`g`| Group owner.
|`o`| Short for “others” but means world.
|`a` or ` `| Short for “all.” This is the combination of “`u`”, “`g`”, and “`o`”.

• Which operation will be performed

|Operation| Meaning
|-|-
|`+`| Indicating that a permission is to be added
|`-`| Indicating that a permission is to be taken away
|`=`| Indicating that only the specified permissions are to be applied and that all others are to be removed.

• What permission will be set

|Permission| Meaning
|-|-
|`r`| Read
|`w`| Write
|`x`| Execute

<br />

**Set Default Permission**
```sh
admin  Lynn ~ ∫ umask
current_value
```
It uses octal notation to express a mask of bits to be **removed** from a file's mode attributes
```sh
admin  Lynn ~ ∫ umask [4 octal digits]
```
<br />

**Some Special Permission**

|Name| Octal| Meaning
|-|-|-
|*setuid bit*|`4000`|When applied to an executable file, it sets the effective user ID from that of the real user (the user actually running the program) to that of the program's owner. Most often this is given to a few programs owned by the superuser. When an ordinary user runs a program that is “setuid root” , the program runs with the effective privileges of the superuser. This allows the program to access files and directories that an ordinary user would normally be prohibited from accessing.
|*setgid bit*| `2000`| Changes the effective group ID from the real group ID of the real user to that of the file owner. If the setgid bit is set on a directory, newly created files in the directory will be given the group ownership of the directory rather the group ownership of the file's creator. This is useful in a shared directory when members of a common group need access to all the files in the directory, regardless of the file owner's primary group.
|*sticky bit*| `1000`| Mark an executable file as “not swappable.” On files, Linux ignores the sticky bit, but if applied to a directory, it prevents users from deleting or renaming files unless the user is either the owner of the directory, the owner of the file, or the superuser. This is often used to control access to a shared directory, such as /tmp.

• Assigning setuid to a program:
```sh
admin  Lynn ~ ∫ chmod u+s program
```

• Assigning setgid to a directory:
```sh
admin  Lynn ~ ∫ chmod g+s dir
```

• Assigning the sticky bit to a directory:
```sh
admin  Lynn ~ ∫ chmod +t dir
```

A program that is setuid: `-rwsr-xr-x`
A directory that has the setgid attribute: `drwxrwsr-x`
A directory with the sticky bit set: `drwxrwxrwt`

<br />

**Changing Identities**
Take on an alternate identity.

|Command| Ability
|-|-
|`su`|Allows us to assume the identity of another user and either start a new shell session with that user's ID, or to issue a single command as that user.
|`sudo`| Allows an administrator to set up a configuration file called `/etc/sudoers` and define specific commands that particular users are permitted to execute under an assumed identity.

**Run a Shell with Substitute User and Group IDs**
```sh
admin  Lynn ~ ∫ su [-[l]] [user] 
```
- If the “`-l`” option is included, the resulting shell session is a login shell for the specified
user: the user's environment is loaded and the working directory is changed to the user's home directory. 
- If the user is not specified, the superuser is assumed.

Shell for superuser:
```sh
admin  Lynn ~ ∫ % su -
Password:
root  Lynn ~ ∫ #
```
Return to previous shell
```sh
root  Lynn ~ ∫ # exit
admin  Lynn ~ ∫ %
```
Execute single command
```sh
admin  Lynn ~ ∫ su -c 'command'
```
<br />

**Execute a Command as Another User**
- `sudo` does not require access to the superuser's password. To authenticating using `sudo`, requires the user’s own password.
- `sudo` does not start a new shell, nor does it load another user's environment. This means that commands do not need to be quoted any differently than they would be without using `sudo`
```sh
admin  Lynn ~ ∫ sudo command
```
<br />

**Change File Owner and Group**
- Command is used to change the owner and group owner of a file or directory.
- Superuser privileges are required to use this command.

```sh
admin  Lynn ~ ∫ chown [owner][:[group]] file...
```

|Argument| Results
|-|-
|`user`| Changes the ownership of the file from its current owner to `user`.
|`user:group`| Changes the ownership of the file from its current owner to `user` and changes the file group owner to `group`.
|`:group`| Changes the group owner to `group`. The file owner is unchanged.
|`user:`| Changes the file owner from the current owner to `user` and changes the group owner to the login group of `user`

<br />

**Changing Your Password**
```sh
admin  Lynn ~ ∫ passwd user
Changing password for user.
Old Password:
New Password:
```
<br />
