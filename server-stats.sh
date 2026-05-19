#!/bin/bash
echo "================ SERVER PERFORMANCE STATS ================"

# 🧠 CPU USAGE
echo -e "\n🔥 CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
awk '{print "CPU Usage: " 100 - $8 "%"}'

# 🧠 MEMORY USAGE
echo -e "\n🧠 Memory Usage:"
free -m | awk 'NR==2{
  printf "Used: %sMB / %sMB (%.2f%%)\n", $3,$2,$3*100/$2
}'

# 💾 DISK USAGE
echo -e "\n💾 Disk Usage:"
df -h / | awk 'NR==2{
  print "Used:", $3, " / ", $2, " (" $5 ")"
}'

# 🚀 TOP 5 CPU PROCESSES
echo -e "\n🚀 Top 5 CPU Processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -6

# 🧠 TOP 5 MEMORY PROCESSES
echo -e "\n🧠 Top 5 Memory Processes:"
ps -eo pid,comm,%mem --sort=-%mem | head -6

# 🖥️ SYSTEM INFO (Stretch)
echo -e "\n🖥️ System Info:"
echo "OS: $(uname -o)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "Load Average: $(uptime | awk -F'load average:' '{print $2}')"
echo "Logged in users: $(who | wc -l)"

echo -e "\n================ END OF REPORT ================"
