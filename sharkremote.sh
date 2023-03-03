#!/bin/bash
# Author: Stian Skogbrott
# This script needs to be edited with parameters relevant to the task
# Define the remote computer's IP address or hostname
REMOTE_HOST="192.168.0.2"

# Define the remote capture interface
REMOTE_IFACE="eth0"

# Define the local capture interface
LOCAL_IFACE="eth0"

# Define the capture file name
CAPTURE_FILE="capture.pcap"

# Define the capture filter
CAPTURE_FILTER=""

# Define the SSH options
SSH_OPTS="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

# Define the Wireshark options
WIRESHARK_OPTS="-k -i -"

# Define a function to start the remote capture
function start_remote_capture {
  ssh $SSH_OPTS $REMOTE_HOST "sudo tcpdump -U -w - -i $REMOTE_IFACE" > $CAPTURE_FILE &
  wireshark $WIRESHARK_OPTS < $CAPTURE_FILE
}

# Define a function to set a timed capture for 5 minutes
function set_timed_capture {
  echo "Starting capture for 5 minutes..."
  ssh $SSH_OPTS $REMOTE_HOST "sudo tcpdump -U -w - -i $REMOTE_IFACE" > $CAPTURE_FILE &
  sleep 300
  kill $!
  wireshark $WIRESHARK_OPTS < $CAPTURE_FILE
}

# Define a function to set a capture filter
function set_capture_filter {
  echo "Enter the capture filter (press Enter to clear):"
  read CAPTURE_FILTER
}

# Display the menu
while true; do
  echo ""
  echo "Choose an option:"
  echo "1. Start remote capture"
  echo "2. Set timed capture for 5 minutes"
  echo "3. Set capture filter"
  echo "4. Exit"
  read CHOICE

  case $CHOICE in
    1)
      start_remote_capture
      ;;
    2)
      set_timed_capture
      ;;
    3)
      set_capture_filter
      ;;
    4)
      exit 0
      ;;
    *)
      echo "Invalid choice. Please try again."
      ;;
  esac
done
