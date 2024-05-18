#!/bin/bash


#built-in-params
#inviteonly=false coming in version 2.0
#customcode=false ------ || ------
#customc=""
username=$(whoami)

invparam() {
  echo "error: invalid parameters entered. Use 'fri --help' to see available parameters."
  exit 1
}

if [[ "$1" == "--help" ]]; then
  echo "Create a chat room: fri --create/-c"
  echo "Join a chat room: fri --join/-j (code)"
  #echo "Completely uninstall [fri]: fri --uninstall"
  echo "Completely uninstall [fri]: sudo /etc/fri-uninstall.sh"
elif [[ "$1" == "--create" ]] || [[ "$1" == "-c" ]]; then
  if [[ "$2" == "" ]]; then
    /etc/fri/chatroom.sh
#FOR VERSION 2.0

#  elif [[ "$2" == "-o" ]]
#    read -p "Do you want the chat room to be invite only? (Y/n): " inviteonlyinput
#    if [[ "$inviteonlyinput" == "Y" ]] || [[ "$inviteonlyinput" == "y" ]] || [[ "$inviteonlyinput" == "Yes" ]] || [[ "$inviteonlyinput" == "yes" ]] || [[ "$inviteonlyinput" == "YES" ]]; then
#      inviteonly=true
#    fi
#    read -p "Do you want to create a custom code for the chat room?"

#/FOR VERSION 2.0
  else
    invparam
  fi
  #continue_here
elif [[ "$1" == "--join" ]] || [[ "$1" == "-j" ]]; then
  if [[ "$2" != "$1" ]]; then
    code="$2"
    if [[ "$code" != "" ]]; then
      /etc/fri/joinroom.sh $code
    else
      invparam
    fi
  else
    invparam
  fi
#elif [[ "$1" == "--uninstall" ]]; then
#  read -p "Do you want the chat room to be invite only? (Y/n): " uninstallinput
#  if [[ "$uninstallinput" == "Y" ]] || [[ "$uninstallinput" == "y" ]] || [[ "$uninstallinput" == "Yes" ]] || [[ "$uninstallinput" == "yes" ]] || [[ "$uninstallinput" == "YES" ]]; then
#    echo "UNINSTALLING, PLEASE WAIT..."
#    sudo /etc/fri-uninstall.sh || echo "A CRTITICAL ERROR OCCURED. [fri] COULD NOT BE UNINSTALLED. (ERROR: UNINSTALL SCRIPT MISSING OR INACCESSIBLE - /etc/fri-uninstall.sh)"
#  else
#    echo "Canceling..."
#    exit 0
#  fi
elif [[ "$1" == "" ]]; then
  friends || echo "A CRITICAL ERROR OCCURED. #x235"
  exit 0
else
  invparam
fi
