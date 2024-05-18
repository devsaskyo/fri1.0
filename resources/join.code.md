#!/bin/bash


roomcode="$1"

ffile="/etc/fri/room/${roomcode}.friroom"
if [ ! -e "$ffile" ]; then
  echo "error: ROOM NOT FOUND."
  exit 1
fi

roomfile="/etc/fri/room/${roomcode}.friroom"
username=$(whoami)

roomfilecont=$(cat $roomfile)

if [[ "$roomfilecont" == *"| ${username}]"* ]] || [[ "$roomfilecont" == *"<!> User ${username} joined."* ]]; then
  randcode=$(printf "%06d\n" $(( $(od -An -N3 -i /dev/urandom) % 1000000 )))
  username="${username}(${randcode})"
fi

ctrl_c() {
  #New msg
  clear
  read -p "(new-message): " msginput

  #REMINDER: ADD MESSAGE CHECK FOR '<!>' SO THAT USERS CANNOT SEND fri SYSTEN NESSAGES.
  if [[ "$msginput" == "/"* ]]; then
    if [[ "$msginput" == "/fri "* ]]; then
      if [[ "$msginput" == "/fri exit" ]]; then
        echo "EXITING THIS CHATROOM IN 1s..."
        sleep 1
        echo "<!> User $username left." >> $roomfile
        exit 1
#        rm $roomfile || echo "CRITICAL ERROR, COULD NOT REMOVE THE ROOM FILE. (${roomfile}>        exit 0
      elif [[ "$msginput" == "/fri help" ]]; then
        echo "<!fri> All available [/fri] commands: /fri help, /fri exit"
      else
#        echo "#some cmd executed..."
         echo "<!>ERROR. YOU DO NOT HAVE THE PERMISSION TO EXECUTE COMMANDS."
      fi
    else
      echo "<!> ERROR: INVALID COMMAND PREFIX. type '/fri help' to see a full list of commands."
    fi
  sleep 2
  else
    current_time=$(date +"%H:%M:%S")
    fullmsg="[${current_time} | ${username}]>> ${msginput}"
    if [ -e "$roomfile" ]; then
      echo $fullmsg >> $roomfile
    else
      echo "THE ROOM YOU ARE IN NO LONGER EXISTS. EXITING..."
      exit 1
    fi
  fi
}

criterror() {
  echo "A CRITICAL ERROR OCCURRED. EXITING CHATROOM..."
  exit 1
}

trap ctrl_c SIGINT

echo "<!> User $username joined." >> $roomfile

while true; do
  watch -n 1 tail $roomfile || criterror
done
