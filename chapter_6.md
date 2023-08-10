# Redirection
- Standard Input (`stdin`)
- Standard Ouput (`stdout`)
- Standard Error (`stderr`)

**Redirecting Standard Output**
```sh
admin  Lynn ~ ∫ command > file
```
Create new empty file trick
```sh
admin  Lynn ~ ∫ > file
```
Append output to File
```sh
admin  Lynn ~ ∫ command >> file
```
<br />

**Redirecting Standard Error**
```sh
admin  Lynn ~ ∫ command 2> file
```
<br />

**Redirecting Standard Output and Standard Error to One file**
Old way
```sh
admin  Lynn ~ ∫ command > file 2>&1  
```
New way
```sh
admin  Lynn ~ ∫ command &> file 
```
Append
```sh
admin  Lynn ~ ∫ command &>> file 
```
<br />

**Disposing of Unwanted Output**
```sh
admin  Lynn ~ ∫ command > /dev/null
```
<br />

**Redirecting Standard Input**
Concatenate Files To `stdout`
```sh
admin  Lynn ~ ∫ cat files...
file1_content
...
fileN_content
```

Merge Multiple Files
```sh
admin  Lynn ~ ∫ cat files... > file
```

Create Short Text Files
```sh
admin  Lynn ~ ∫ cat > file
input...
```
- Type <kbd>Ctrl</kbd>+<kbd>d</kbd> to add `EOF` (End Of File)

Another Way To Use
```sh
admin  Lynn ~ ∫ cat < files...
file1_content
...
fileN_content
```
<br />

**Pipelines**
```sh
admin  Lynn ~ ∫ command1 | command2 
```
- command1's `output` = command2's `input`

Difference Between `>` and `|`
|`>`|`|`
|-|-
|Command to File|Command to Command
<br />

**Filters**
```sh
admin  Lynn ~ ∫ command1 | ... | filters | ... | commandN
```
`sort` - Sort data to a single list
```sh
admin  Lynn ~ ∫ command | sort | command
```
`uniq` - Report or omit repeated lines
```sh
admin  Lynn ~ ∫ command | sort | uniq | command
```
`wc` - Print Line, Word and Byte Counts
```sh
admin  Lynn ~ ∫ wc file
```
```sh
admin  Lynn ~ ∫ command | sort | uniq | wc
```
<br />

**Print Lines Matching A Patterns**
```sh
admin  Lynn ~ ∫ grep pattern files...
```
<br />

**Print First/Last Part Of Files**
```sh
admin  Lynn ~ ∫ head file 
```
```sh
admin  Lynn ~ ∫ tail file
```
Options
- Adjust number of lines (*default 10*)
```sh
admin  Lynn ~ ∫ head/tail -n numOfLines file
```
- View in real-time
```sh
admin  Lynn ~ ∫ tail -f file
```
<br />

**Read from `Stdin` and Output to `Stdout` and Files**
```sh
admin  Lynn ~ ∫ command1 | tee file | command2
```
<br />