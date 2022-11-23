#!/usr/bin/expect -f

set username "developer"
set password "C1sco12345"
set devices [open "devicelists.txt"]
set date [clock format [clock seconds] -format {%d%m%Y-%T}]

while {[gets $devices device] !=-1} {
        spawn ssh -o StrictHostKeyChecking=no -l $username $device
        expect "*assword: "
        send "$password\n"
        log_file -noappend $device-$date.log
        expect "$ "
        send "terminal length 0\n"
        send "show run | i hostname\n"
        puts "show clock\n"
        expect "$ "
        send "exit\r"
        log_file
        interact
        }
close $devices