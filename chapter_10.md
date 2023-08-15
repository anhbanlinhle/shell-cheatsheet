# Processes

**Viewing Processes**
Processes associated with the current terminal session
```sh
admin  Lynn ~ ∫ ps
  PID TTY           TIME CMD
67560 ttys000    0:00.33 -zsh
```
- `TTY` is short for “teletype”, and refers to the controlling terminal for the process.
- `TIME` is the amount of CPU time consumed by the process

All processes regardless of what terminal (if any) they are controlled by. 
```sh
admin  Lynn ~ ∫ ps x
  PID   TT  STAT      TIME COMMAND
...
```
- The presence of a “?” in the `TTY` column indicates no controlling terminal.
- `STAT` is short for “state” and reveals the current status of the process.

|State| Meaning
|-|-
|`R`| Running. This means that the process is running or ready to run.
|`S`| Sleeping. The process is not running; rather, it is waiting for an event, such as a keystroke or network packet.
|`D`| Uninterruptible sleep. The process is waiting for I/O such as a disk drive.
|`T`| Stopped. The process has been instructed to stop.
|`Z`| A defunct or “zombie” process. This is a child process that has terminated but has not been cleaned up by its parent.
|`<`| A high-priority process. It's possible to grant more importance to a process, giving it more time on the CPU. This property of a process is called niceness. A process with high priority is said to be less nice because it's taking more of the CPU's time, which leaves less for everybody else.
|`N`| A low-priority process. A process with low priority (a “nice” process) will get processor time only after other processes with higher priority have been serviced.

Displays the processes belonging to every user

```sh
admin  Lynn ~ ∫ ps aux
USER    PID  %CPU %MEM      VSZ    RSS   TT  STAT STARTED      TIME COMMAND
... 
```

|Header| Meaning
|-|-
|`USER`| User ID. This is the owner of the process.
|`%CPU`| CPU usage in percent.
|`%MEM`| Memory usage in percent.
|`VSZ`| Virtual memory size.
|`RSS`| Resident set size. This is the amount of physical memory (RAM) the process is using in kilobytes.
|`START`| Time when the process started. For values over 24 hours, a date is used.

<br />

**Viewing Processes Dynamically**
- `ps` provides only a snapshot of the machine's state at the moment the command is executed.
- `top` program displays a continuously updating  display of the system processes listed in order of process activity.
```sh
admin  Lynn ~ ∫ top 
```
<br />

**Controlling Processes**
Running a Command-Line Program
```sh
admin  Lynn ~ ∫ program
...
```
Interrupting a Process
- In a terminal, pressing <kbd>Ctrl</kbd>+<kbd>C</kbd>, interrupts a program.

```sh
admin  Lynn ~ ∫ program
admin  Lynn ~ ∫
```
- Many (but not all) command-line programs can be interrupted by using this technique.

Putting a Process in the Background
- *foreground* (with stuff visible on the surface like the shell prompt) 
- *background* (with stuff hidden behind the surface)

*To launch a program so that it is immediately placed in the background:*

```sh
admin  Lynn ~ ∫ program &
[1] PID
admin  Lynn ~ ∫
```

*List the jobs that have been launched from terminal:*
```sh
admin  Lynn ~ ∫ jobs
[1]  + running    program &
```

Returning a Process to the Foreground
- A process in the background is immune from terminal keyboard input, including <kbd>Ctrl</kbd>+<kbd>C</kbd>.

*Return a process to the foreground:*
```sh
admin  Lynn ~ ∫ jobs
... 
[jobspec]   + running   program
...
admin  Lynn ~ ∫ fg %jobspec
program
```

Stopping (Pausing) a Process
- In a terminal, pressing <kbd>Ctrl</kbd>+<kbd>Z</kbd>, top a process without terminating it.

```sh
admin  Lynn ~ ∫ program
[1]  + suspended  program
admin  Lynn ~ ∫
```
|Continue the program's execution in the foreground|Resume the program's execution in the background
|-|-
|`fg %jobspec`|`bg %jobspec`

<br />

**Signals**
Sends a signal to the program
```sh
admin  Lynn ~ ∫ kill PID
```
```sh
admin  Lynn ~ ∫ kill %jobspec
```

|Keystroke| Signal| Meaning
|-|-|-
|<kbd>Ctrl</kbd>+<kbd>C</kbd>|`INT`|interrupt
|<kbd>Ctrl</kbd>+<kbd>Z</kbd>|`TSTP`|terminal stop
<br />

**Sending Signals to Processes**
```sh
admin  Lynn ~ ∫ kill [-signal] PID... 
```
- No signal is specified: `TERM` (terminate) signal is sent by default.

|Number| Name| Meaning
|-|-|-
|`1`| `HUP`| Hangup. This is a vestige of the good old days when terminals were attached to remote computers with phone lines and modems. The signal is used to indicate to programs that the controlling terminal has “hung up.” The effect of this signal can be demonstrated by closing a terminal session. The foreground program running on the terminal will be sent the signal and will terminate. This signal is also used by many daemon programs to cause a reinitialization. This means that when a daemon is sent this signal, it will restart and reread its configuration file. The Apache web server is an example of a daemon that uses the `HUP` signal in this way.
|`2` |`INT`| Interrupt. This performs the same function as a <kbd>Ctrl</kbd>+<kbd>C</kbd> sent from the terminal. It will usually terminate a program.
|`9`| `KILL`| Kill. This signal is special. Whereas programs may choose to handle signals sent to them in different ways, including ignoring them all together, the `KILL` signal is never actually sent to the target program. Rather, the kernel immediately terminates the process. When a process is terminated in this manner, it is given no opportunity to “clean up” after itself or save its work. For this reason, the `KILL` signal should be used only as a last resort when other termination signals fail.
|`15`| `TERM`| Terminate. This is the default signal sent by the kill command. If a program is still “alive” enough to receive signals, it will terminate.
|`18`| `CONT`| Continue. This will restore a process after a `STOP` or `TSTP` signal. This signal is sent by the `bg` and `fg` commands.
|`19`| `STOP`| Stop. This signal causes a process to pause without terminating. Like the `KILL` signal, it is not sent to the target process, and thus it cannot be ignored.
|`20`| `TSTP`| Terminal stop. This is the signal sent by the terminal when <kbd>Ctrl</kbd>+<kbd>Z</kbd> is pressed. Unlike the `STOP` signal, the `TSTP` signal is received by the program, but the program may choose to ignore it.

Other signals frequently used by the system

|Number| Name| Meaning
|-|-|-
|`3`| `QUIT`| Quit.
|`11`| `SEGV`| Segmentation violation. This signal is sent if a program makes illegal use of memory, that is, if it tried to write somewhere it was not allowed to write.
|`28`| `WINCH`| Window change. This is the signal sent by the system when a window changes size. Some programs, such as top and less will respond to this signal by redrawing themselves to fit the new window dimensions.
<br />

**Sending Signals to Multiple Processes**
```sh
admin  Lynn ~ ∫ killall [-u user] [-signal] name...
```
<br />

**Shutting Down the System**
- Used without any command line options:
```sh
admin  Lynn ~ ∫ halt
```
```sh
admin  Lynn ~ ∫ poweroff
```
```sh
admin  Lynn ~ ∫ reboot
```

- Specify which of the actions to perform (`halt`, `poweroff`, or `reboot`) and provide a time delay to the shutdown event.

`halt`:
```sh
admin  Lynn ~ ∫ shutdown -h now
```
`reboot`:
```sh
admin  Lynn ~ ∫ shutdown -r now
```
<br />