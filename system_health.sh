#!/bin/bash
LOGFILE="health.log"
{
echo "------------System HEALTH REPORT-----------------"
echo "Date: $(date)"
echo
echo "1. CPU USAGE:"
top -bn1 | grep "Cpu" | awk '{print "CPU Load: " $2 "%"}'
echo


echo "2. RAM(Memory) Usage:"
free -m 
echo

echo "3. Disk Usage:"
df -h | grep "/dev/"
echo

echo "4. Top 5 processes:"
ps aux --sort=-%cpu | head -6
echo

echo "5. System Uptime:"
uptime -p
echo
echo "----------------------------------------------"
echo
} | tee -a "$LOGFILE"



