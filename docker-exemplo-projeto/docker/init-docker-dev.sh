echo 'Copiando configuração do ngnix para o o interno...'
docker cp $PWD/docker/build/nginx/app-ponto.conf api-gerenciamento:/etc/nginx/conf.d/

echo 'Copiando configuração do ngnix para o base...'
docker cp $PWD/docker/build/nginx/app-ponto.conf nginx:/etc/nginx/conf.d/

echo "Teste de sinstaxe"
docker exec nginx nginx -t
docker exec api-gerenciamento nginx -t



echo 'Restartando NGINX do container ...'
docker exec api-gerenciamento bash service nginx restart
printf "\n"

docker exec nginx bash service nginx restart
printf "\n"

echo 'Restartando NGINX local...'
docker restart nginx
