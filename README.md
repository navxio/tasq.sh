# tasq

A dead simple task manager that arranges your tasks in a queue
so you could focus on them **one at a time**, without distractions

### Installation
Download tasq.sh

make it executable `chmod u+x tasq.sh`

add it to your `$PATH`

### Usage

Run `./tasq.sh` to print out the latest task to the console

Flags:
`-h, --help` print help text

`-a, --add "task"` adds a task to the *bottom* of the queue

`-x, --mark-done` marks the latest task as done and removes it from the queue
