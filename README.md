# [fri] 1.0
[fri] is a linux tool that allows you to create and join chat rooms

## How to install
### To install, run this on your linux server:
`git clone https://github.com/devsaskyo/fri1.0.git; cd fri1.0; chmod +x fri_1.0_setup.sh; sudo ./fri_1.0_setup.sh;`

## How to use
### Parameters
`fri -c` or `fri --create` will create a new chat room.
`fri -j (roomcode)` or `fri --join (roomcode)` will join a chat room with room code `(roomcode)`.
To uninstall [fri] you can use `sudo /etc/fri-uninstall.sh`.

### Commands
Once in a chat room, you can use the `/fri exit` command to exit the chat room (if you are a user) or to exit and completely remove the chat room (if you are the chat room administrator).

### File paths
All* [fri] files are stored in the `/etc/fri/` directory.

*the uninstall file (`/etc/fri-uninstall.sh`) and the [fri] install dependencies (in the git clone directory) are not located in this directory.


[fri] 1.0 - Made By 𝚂𝙰𝚂𝙺𝚈𝙾
