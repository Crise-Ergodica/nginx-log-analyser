#!/usr/bin/env bash

################################################################################
# Method Comparison Script
#
# This script demonstrates the differences between AWK, GREP, and SED methods
# for analyzing Nginx logs. It also provides performance timing for each method.
################################################################################

set -euo pipefail

# Colors
readonly GREEN='\033[0;32m'
readonly BLUE='\033[0;34m'
readonly YELLOW='\033[1;33m'
readonly NC='\033[0m'

echo -e "${GREEN}═══════════════════════════════════════════════════${NC}"
echo -e "${GREEN}     Nginx Log Analyser - Method Comparison${NC}"
echo -e "${GREEN}═══════════════════════════════════════════════════${NC}"
echo

# Check if log file is provided
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <nginx-access.log>"
    echo
    echo "Example:"
    echo "  $0 nginx-access.log"
    exit 1
fi

LOG_FILE="$1"

if [[ ! -f "$LOG_FILE" ]]; then
    echo "Error: Log file not found: $LOG_FILE"
    exit 1
fi

echo -e "${BLUE}Analyzing log file: $LOG_FILE${NC}"
echo

# Function to measure execution time
run_with_timing() {
    local method=$1
    local start end elapsed
    
    echo -e "${YELLOW}━━━ Method: $method ━━━${NC}"
    
    start=$(date +%s.%N)
    ../nginx-log-analyser --method "$method" "$LOG_FILE" > /dev/null
    end=$(date +%s.%N)
    
    elapsed=$(echo "$end - $start" | bc)
    echo -e "${GREEN}Execution time: ${elapsed}s${NC}"
    echo
}

echo -e "${BLUE}Running analysis with all three methods...${NC}"
echo

# Run each method
run_with_timing "awk"
run_with_timing "grep"
run_with_timing "sed"

echo -e "${GREEN}═══════════════════════════════════════════════════${NC}"
echo -e "${GREEN}Comparison complete!${NC}"
echo -e "${GREEN}═══════════════════════════════════════════════════${NC}"
echo
echo "Notes:"
echo "  - AWK is typically the fastest for this type of processing"
echo "  - GREP is good for pattern matching but chains more commands"
echo "  - SED is powerful for text transformation but can be slower"
echo
