#!/usr/bin/expect -f

set username "admin"
set hostname "10.66.49.197"
set password "cisco123"

spawn ssh $username@$hostname
expect "*assword: "
send "$password\r"
log_file -noappend show_run.log
expect "$ "
send "terminal length 0\r"
send "show run\r"
expect "$ "
send "exit\r"