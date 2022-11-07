#!/usr/bin/expect -f

set username "admin"
set hostname "10.66.49.197"

spawn ssh $username@$hostname
expect "*assword: "
send "cisco123\r"
expect "$ "
send "terminal length 0\r"
send "show run\r"
expect "$ "
send "exit\r"