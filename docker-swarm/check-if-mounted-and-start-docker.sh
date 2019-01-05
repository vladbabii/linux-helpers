mount="/mnt/shared"
mounttype="/mnt/shared fuse.glusterfs rw"

if grep -qs "$mount" /proc/mounts; then
  echo "It's mounted."
else
  echo "It's not mounted."
  mount "$mount"
  if [ $? -eq 0 ]; then
   echo "Mount success!"
  else
   echo "Something went wrong with the mount..."
  fi
fi

mountok=0

if grep -qs "$mounttype" /proc/mounts; then
  mountok=1
fi


if [ "$mountok" -eq 1 ]; then
  echo "Making sure docker is started"
  if pgrep -x "dockerd" > /dev/null; then
    echo ".. running"
  else
    echo ".. starting .."
    systemctl start docker
    echo ".. done"
  fi
else
  echo "Making sure docker is stopped"
  if pgrep -x "dockerd" > /dev/null; then
    echo ".. running .."
    systemctl stop docker
    echo ".. done"
  else
    echo ".. stopped"
  fi

fi
