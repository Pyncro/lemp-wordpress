#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to check service
check_service() {
  COLOR=$1
  SERVICE=$2
  echo -e "${COLOR}Running ${SERVICE}...${NC}"
  systemctl status "$SERVICE" --no-pager
  echo -e "${GREEN}${SERVICE} working perfectly✅${NC}"
  echo ""
  sleep 3
}

# Check each service
check_service "$RED" "nginx"
check_service "$BLUE" "postfix"
check_service "$CYAN" "dovecot"
check_service "$GREEN" "mariadb"

# Run fastfetch
fastfetch
