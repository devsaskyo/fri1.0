# [fri] 1.0
[fri] is a linux tool that allows you to create and join chat rooms

## How to install
### To install, run this on your linux server:
`if [ -e ./fri1.0 ]; then echo "error"; else git clone https://github.com/devsaskyo/fri1.0.git; cd fri1.0; chmod +x fri_1.0_setup.sh; sudo ./fri_1.0_setup.sh; cd ..; rm -rf ./fri1.0; fi`
<br>
<br>
**This is the safest way to install [fri].**
<br>
If you get the error message, it means there is a 'fri1.0' directory already present in your current working directory. Change your working directory, and try again.
<br>
Note: You need superuser permissions to install [fri].
<br>
<br>
**If you wish to keep the [fri] install resources after setup, please run this instead:**
<br>
Install without deleting install files after setting up:<br>
`git clone https://github.com/devsaskyo/fri1.0.git; cd fri1.0; chmod +x fri_1.0_setup.sh; sudo ./fri_1.0_setup.sh;`

## How to use
### Parameters
`fri -c` or `fri --create` will create a new chat room.
<br>
`fri -j (roomcode)` or `fri --join (roomcode)` will join a chat room with room code `(roomcode)`.
<br>
`fri --help` will show you available parameters.
<br>
You may also use the `friends` command, which [fri] uses to display general info.

### Commands
Once in a chat room, you can use the `/fri exit` command to exit the chat room (if you are a chat room user) or to exit and completely remove the chat room (if you are the chat room administrator).

### How does it work
Every chat room is stored as a `.friroom` file in the `/etc/fri/room/` directory. A chat room is dependent on the chat room admin (the user who created the chat room) to work. The chat room admin is runnning a script which is in charge of controlling the chat room. It is possible to create a working chat room without a chat room administrator, but it is not recommended, since the chat room has to be deleted manually (`rm /etc/fri/room/${roomcode}.friroom`).
<br>
Note: **While in a chat room, do NOT send any sensitive information (unless you fully understand the risks\*).**
<br>
*If you do not want a user/users on your server to have access to chat room messages, please modify the permissions of the user(s) and/or the `/etc/fri/room` directory. For example, you can use `chmod 600 /etc/fri/room` to restrict non-superusers read permissions for all chat rooms.

### File paths
All* [fri] files are stored in the `/etc/fri/` directory.

*the uninstall file (`/etc/fri-uninstall.sh`) and the [fri] install resources (in the git clone directory) are not located in this directory.

### Uninstall
To uninstall [fri], use `sudo /etc/fri-uninstall.sh`.
<br>
Note: This removes the whole `/etc/fri` directory and these files: `/usr/bin/fri`, `/usr/bin/friends`, `/etc/fri-uninstall.sh`. Uninstalling [fri] does NOT remove the install resources.

[fri] 1.0 - Made By 𝚂𝙰𝚂𝙺𝚈𝙾
