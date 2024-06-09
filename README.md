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
You may also use the `friends` command, which [fri] uses to display general info.

### Commands
Once in a chat room, you can use the `/fri exit` command to exit the chat room (if you are a user) or to exit and completely remove the chat room (if you are the chat room administrator).

### File paths
All* [fri] files are stored in the `/etc/fri/` directory.

*the uninstall file (`/etc/fri-uninstall.sh`) and the [fri] install resources (in the git clone directory) are not located in this directory.

### Uninstall
To uninstall [fri], use `sudo /etc/fri-uninstall.sh`.
<br>
Note: This removes the whole `/etc/fri` directory and these files: `/usr/bin/fri`, `/usr/bin/friends`, `/etc/fri-uninstall.sh`. Uninstalling [fri] does NOT remove the install resources.

[fri] 1.0 - Made By 𝚂𝙰𝚂𝙺𝚈𝙾
