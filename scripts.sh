echo $1

if [ "$1" == "setup" ]

then
  curl -L https://github.com/docker/compose/releases/download/1.5.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
elif [ "$1" == "upgrade" ]

then 
  docker exec ${PWD##*/}_postgres_1 pg_dump -U postgres -c -f /backup/output.tar -b -F tar postgres
  docker-compose kill
  docker-compose rm -v
  docker-compose up -d
  sleep 5
  docker exec ${PWD##*/}_postgres_1  pg_restore -U postgres -d postgres "/backup/output.tar"
  rm output.tar

fi