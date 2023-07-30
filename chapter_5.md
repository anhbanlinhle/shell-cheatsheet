# Working with Commands

**Identifying Commands**
```sh
admin  Lynn ~ ∫  type commands...
```
Outcomes:
- An executable program
```
command is /bin/...
```
- A shell function
```
command is a shell builtin
```
- An alias
``` 
command is aliased to  `...` 
```

<br />

**Executable's Location**
```sh
admin  Lynn ~ ∫ which commands...
```
<br />

**Command's Documentation**
```sh
admin  Lynn ~ ∫ help command
```
Usage Documentation
```sh
admin  Lynn ~ ∫ command --help
```
<br />

**Program's Manual Page**
```sh
admin  Lynn ~ ∫ man program
```
Section
```sh
admin  Lynn ~ ∫ man section search_term 
```
|Section|Contents|
|-|-|
|`1`| User commands|
|`2`|Programming interfaces for kernel system calls|
|`3`| Programming interfaces to the C library|
|`4`| Special files such as device nodes and drivers|
|`5`| File formats|
|`6`| Games and amusements such as screen savers|
|`7`| Miscellaneous| 
|`8`| System administration commands|
<br />

**Appropriate Commands**
```sh
admin  Lynn ~ ∫ man -k search_term
```
```sh
admin  Lynn ~ ∫ apropos search_term
```
<br />

**One-line Manual Page**
```sh
admin  Lynn ~ ∫ whatis command
```
<br />

**Program's Info Entry**
```sh
admin  Lynn ~ ∫ info programs
```
Commands
|Command|Action
|-|-
|<kbd>?</kbd>| Display command help
|<kbd>PgUp</kbd> or <kbd>Backspace</kbd>| Display previous page
|<kbd>PgDn</kbd> or <kbd>Space</kbd>| Display next page
|<kbd>n</kbd>| Next - Display the next node
|<kbd>p</kbd>| Previous - Display the previous node
|<kbd>u</kbd>| Up - Display the parent node of the currently displayed node, usually a menu
|<kbd>Enter</kbd>| Follow the hyperlink at the cursor location
|<kbd>q</kbd>| Quit
<br />

**Creating Commands**
Multiple Commands in One line Trick
```sh
admin  Lynn ~ ∫ command1; command2; command3...
```

Structure
```sh
admin  Lynn ~ ∫ alias name='string'
```
```sh
admin  Lynn ~ ∫ type name
name is aliased to `...`
```

Remove alias
```sh
admin  Lynn ~ ∫ unalias name
```

Show all aliases defined
```sh
admin  Lynn ~ ∫ alias
```
<br />