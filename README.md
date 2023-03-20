# Estrutura basica para configuração de ambiente com docker 
```
PHP - 8.1
MySql - 8.0
Redis 
Nginx 
```
## Requisitos
```
docker 
docker-compose
```

## Instalação docker & docker-compose:
 [LINUX](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04-pt)
 
 [WINDONS](https://docs.docker.com/desktop/install/windows-install/)
 
 [MAC](https://docs.docker.com/desktop/install/mac-install/)

## Após clonar

Rode os comandos a seguir na pasta do projeto:
```
docker-compose up -d --build
```
```
Isso subirá o seu ambiente de desenvolvimento
```

### Verifique o do status do ambiente com o comando:

```
docker-compose ps -a
```

### Vai aparecer algo semelhante a isso:

![alt text](./img/terminal.png)

Sua base para desenvolvimento está pronta, agora siga o passo a passo no projeto desejado para usar o ambiente.


