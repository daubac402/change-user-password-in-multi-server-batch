#!/bin/bash
IFS= read -rp "Enter username: " username
IFS= read -rsp "Enter new password: " new_password
echo    # just to get a newline
IFS= read -rsp "Repeat new password: " new_password_2
echo
[ "$new_password" = "$new_password_2" ] || { echo "Mismatch. Aborting."; exit 1; }
for server in $(cat serverlist.txt)
   do echo "Server IP is: $server"
   printf '%s\n' "$new_password" "$new_password" | ssh "$server" "passwd -- ${username@Q}"
done
