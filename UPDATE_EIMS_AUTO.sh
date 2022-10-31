#!/bin/bash

 p=`lftp -e "cls --sort=date /eims_versions/astra-1.6/eims-Elina | head -1 && exit" 100.100.105.110`
 echo "Скачивается версия ИМС:"
 echo $p
 lftp -e "get $p -o eims.tar.gz && exit" 100.100.105.110
 ansible-playbook eims-update.yml
 rm ./eims.tar.gz
 echo "----------Завершено----------"
