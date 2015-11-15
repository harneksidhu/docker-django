echo $1

if [ $1 == 'setup' ]

then
  curl -L https://github.com/docker/compose/releases/download/1.5.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose

elif [ $1 == 'upgrade' ]

then 
  docker run --rm --volumes-from dockerdjango_data_1 -v $(pwd):/backup busybox tar cvf /backup/backup.tar /var/lib/postgresql
  docker-compose kill
  docker-compose rm -v
  docker-compose up -d
  docker run --rm --volumes-from dockerdjango_data_1 -v $(pwd):/backup busybox tar xvf /backup/backup.tar -C /var/lib/postgresql
  rm backup.tar

fi
