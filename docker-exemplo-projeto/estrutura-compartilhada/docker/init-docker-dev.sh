echo 'Copiando configuração do ngnix do projeto para o container do mesmo...'
docker cp $PWD/docker/build/nginx/gym-api.conf api-exemplo-container:/etc/nginx/conf.d/

echo 'Copiando configuração do ngnix para o nginx base...'
docker cp $PWD/docker/build/nginx/gym-api.conf nginx:/etc/nginx/conf.d/

echo "Teste de sinstaxe"
docker exec nginx nginx -t
docker exec api-exemplo-container nginx -t

echo 'Restartando NGINX do container ...'
docker exec api-exemplo-container bash service nginx restart
printf "\n"

docker exec nginx bash service nginx restart
printf "\n"

echo 'Restartando NGINX local...'
docker restart nginx
