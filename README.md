Remote Traffic Capture Script

This script allows you to remotely capture traffic from a Linux computer over the internet using SSH. It provides an interactive menu with the following options:

Start a live capture: Starts a live packet capture on the remote computer and displays the output in the terminal.
Set a timed capture: Allows you to set a timer for the capture to stop after a certain number of minutes.
Set a filter: Allows you to set a capture filter to only capture traffic that matches certain criteria.
Exit: Exits the script.
Requirements
Linux operating system
Wireshark installed on both local and remote computers
SSH access to the remote computer
Usage
1.Clone the repository or copy the contents of the script to a local file.
2.Open a terminal and navigate to the directory where the script is located.
3.Run the script using the command ./remote_capture.sh.
4.Follow the on-screen instructions to remotely capture traffic from the remote computer.

Note: It is recommended to run the script as a superuser (i.e., using sudo ./remote_capture.sh) to ensure proper permissions for capturing network traffic.
