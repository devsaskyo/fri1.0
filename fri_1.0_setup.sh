#!/bin/bash


if [ $EUID -ne 0 ]; then
    echo "Error: insufficient permissions. Please use 'sudo ./fri_1.0_setup.sh' to run."
    exit 1
fi

echo "Installing [fri] version 1.0..."
touch /usr/bin/fri || echo "error: could not execute (line 10)"
chmod +x /usr/bin/fri || echo "error: could not execute (line 11)"
touch /usr/bin/friends || echo "error: could not execute (line 12)"
chmod +x /usr/bin/friends || echo "error: could not execute (line 13)"
echo "#!/bin/bash" > /usr/bin/fri || echo "error: could not execute (line 14)"
echo "#!/bin/bash" > /usr/bin/friends || echo "error: could not execute (line 15)"
mkdir /etc/fri || echo "error: could not execute (line 16)"
echo "/etc/fri/fri1.0.sh \$@" >> /usr/bin/fri || echo "error: could not execute (line 17)"
echo "echo '[fri] version 1.0'" >> /usr/bin/friends || echo "error: could not execute (line 18)"
echo "echo 'Github: https://github.com/devsaskyo/fri1.0'" >> /usr/bin/friends || echo "error: could not execute (line 18b)"
#echo "echo 'to uninstall [fri1.0] run: fri --uninstall'" >> /usr/bin/friends || echo "error: could not execute (line 18c)"
echo "echo 'to uninstall [fri1.0] run: sudo /etc/fri-uninstall.sh'" >> /usr/bin/friends || echo "error: could not execute (line 18c)"
echo "echo '>> Made by 𝚂𝙰𝚂𝙺𝚈𝙾.'" >> /usr/bin/friends || echo "error: could not execute (line 18d)"
touch /etc/fri/fri1.0.sh || echo "error: could not execute (line 19)"
chmod +x /etc/fri/fri1.0.sh || echo "error: could not execute (line 20)"
cp ./resources/code.md /etc/fri/fri1.0.sh || echo "error: could not execute (line 21)"
mkdir /etc/fri/room || echo "error: could not execute (line 22)"
touch /etc/fri/chatroom.sh || echo "error: could not execute (line 23)"
chmod +x /etc/fri/chatroom.sh || echo "error: could not execute (line 24)"
cp ./resources/room.code.md /etc/fri/chatroom.sh || echo "error: could not execute (line 25)"
touch /etc/fri/joinroom.sh || echo "error: could not execute (line 26)"
chmod +x /etc/fri/joinroom.sh || echo "error: could not execute (line 27)"
cp ./resources/join.code.md /etc/fri/joinroom.sh || echo "error: could not execute (line 28)"
touch /etc/fri-uninstall.sh || echo "CRITICAL error: could not execute (line 29)"
chmod +x /etc/fri-uninstall.sh || echo "CRITICAL error: could not execute (line 30)"
cp ./resources/uninstall-script.md /etc/fri-uninstall.sh || echo "CRITICAL error: could not execute (line 31)"

echo "Setup completed."
