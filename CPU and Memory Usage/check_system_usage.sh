#!/bin/bash

# Function to check CPU usage
check_cpu() {
    echo "====== CPU USAGE ======"
    echo ""
    top -b -o +%CPU | head -n 12
}

# Function to check Memory usage
check_memory() {
    echo "====== MEMORY USAGE ======"
    echo ""
    free -h
}

# Function to list top consuming processes
list_top_processes() {
    echo "====== TOP 5 PROCESSES ======"
    echo ""
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
}

# Run the functions
check_cpu
check_memory
list_top_processes

