#!/bin/bash


#roomcode="$1"

#if [[ "$roomcode" == "" ]]; then
  roomcode=$(printf "%06d\n" $(( $(od -An -N3 -i /dev/urandom) % 1000000 )))
  echo "<!> Random room code generated: ${roomcode}"
#fi

ffile="/etc/fri/room/${roomcode}.friroom"
if [ -e "$ffile" ]; then
  echo "error: selected room code is already in use."
  exit 1
fi

touch "/etc/fri/room/${roomcode}.friroom"
chmod +wr "/etc/fri/room/${roomcode}.friroom"

roomfile="/etc/fri/room/${roomcode}.friroom"
username=$(whoami)

#roomfilecont=$(cat $roomfile)

#if [[ "$roomfilecont" == *"| ${username}]"* ]]; then
#  randcode=$(printf "%06d\n" $(( $(od -An -N3 -i /dev/urandom) % 1000000 )))
#  username="${username}(${randcode})"
#fi

echo "<!fri> Welcome. CHAT ROOM CODE: ${roomcode} | use '/fri help' to view the full list of commands." >> $roomfile
echo "<!fri> THE ADMINISTRATOR OF THIS CHATROOM IS: ${username}" >> $roomfile
echo "<Tip> !!! Use ctrl+c to write a new message or execute a command. !!!" >> $roomfile
echo "<!> User $username joined." >> $roomfile

ctrl_c() {
  #New msg
  clear
  read -p "(new-message): " msginput

  if [[ "$msginput" == "/"* ]]; then
    if [[ "$msginput" == "/fri "* ]]; then
      if [[ "$msginput" == "/fri exit" ]]; then
        echo "EXITING AND COMPLETELY REMOVING THIS CHATROOM IN 2s..." >> $roomfile
        sleep 2
        rm $roomfile || echo "CRITICAL ERROR, COULD NOT REMOVE THE ROOM FILE. (${roomfile})"
        exit 0
      elif [[ "$msginput" == "/fri help" ]]; then
        echo "<!fri> All [/fri] commands: /fri help, /fri exit | MORE COMMANDS WILL BE AVAILABLE IN THE 2.0 VERSION."
      #elif [[ "$msginput" == "/fri kick" ]]; then /fri kick will be available in fri2.0
        #echo ""
      else
        echo "ERROR: COMMAND '${msginput}' NOT RECOGNIZED."
      fi
    else
      echo "<!> ERROR: INVALID COMMAND PREFIX. type '/fri help' to see a full list of commands."
    fi
    sleep 2
  else
    current_time=$(date +"%H:%M:%S")
    fullmsg="[${current_time} | ${username}]>> ${msginput}"
    echo $fullmsg >> $roomfile
  fi
}

criterror() {
  echo "A CRITICAL ERROR OCCURRED. EXITING CHATROOM..."
  exit 1
}

trap ctrl_c SIGINT

while true; do
  watch -n 1 tail $roomfile || criterror
done
