Fixing a Webstack Bug

Overview

This project is part of the Webstack Debugging Series, aimed at teaching debugging skills for broken or bugged webstacks. In this task, the objective is to create a Bash script that fixes a specific server issue.

Requirements

The server must:

Have a copy of the /etc/passwd file in /tmp.

Have a file named /tmp/isworking containing the string OK.

The solution involves debugging the server manually and automating the fix using a Bash script.

File Information

0-fix_webstack_bug.bash

This script automates the process of fixing the server by:

Copying /etc/passwd to /tmp.

Creating the file /tmp/isworking with the content OK.

Usage

Prerequisites

Docker installed on your system.

Access to a Docker container running Ubuntu 14.04.

Steps

Clone this repository:

git clone <repository_url>
cd <repository_folder>

Make the script executable:

chmod +x 0-fix_webstack_bug.bash

Run the script inside the Docker container:

docker exec -ti <container_id> /bin/bash
./0-fix_webstack_bug.bash

Verify the fix:

ls /tmp/
cat /tmp/isworking

Validation

Shellcheck

Ensure the script passes Shellcheck without any errors:

shellcheck 0-fix_webstack_bug.bash

Expected Output

The /tmp directory contains the files passwd and isworking.

The content of /tmp/isworking is:

OK

Notes

The script is designed to run on Ubuntu 14.04.

It follows best practices for Bash scripting and passes Shellcheck validation.
