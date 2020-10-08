#!/usr/bin/zsh

# io:["$9", "$10"]    sys:["$11", "$12"]    
function system_status {
	echo "$(vmstat -S M 1 2 | awk 'NR==4 {print "cpu:["$13", "$14", "$15", "$16", "$17"]    mem:["7777-($4+$5+$6)"M, "$4"M, "$5"M, "$6"M]    prc:["$1", "$2"]"}')"
}

function print_cpu_temperature {
	less /proc/acpi/ibm/thermal | awk '{print $2}'
}

function print_date {
	date +"%F %R"
}

while true;
do
	xsetroot -name "  $(print_cpu_temperature)C  $(system_status)  @  $(print_date) ";
	sleep 5s;
done 
