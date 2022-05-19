# Aula-Pratica-BD

## Passos

Instalar mysql e server. Pode ser feito a versão local, mas nesse exemplo foi feito por via de docker.
[Docker Desktop](https://www.docker.com/products/docker-desktop/).\
Após baixar o docker, crie um container de mysql e mysql-server, utilizando os comandos em um cmd ou powershell:\
```docker run --name Aula-BD -p 3306:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -d mysql/mysql-server:latest```\
Onde após o --name é o nome do container, -p especifica a porta do mysql a ser refletida na sua máquina local, MYSQL_ALLOW_EMPTY_PASSWORD para não precisar utilizar senhas (somente para simplificar essa demonstração) e após o -d a imagem, que nesse caso é o mysql e mysql-server (última versão).

Agora pode-se conectar no container mysql criado, com o usuário root, utilizando a interface gráfica ou pelo comando:\
```docker exec -it Aula-BD mysql -u root```\

Rode o comando abaixo para evitar problemas de conexão, dando toda permissão ao usuário root:\
```update mysql.user set host = '%' where user='root';```\

Pronto. Agora é conectar pelo workbench utilizando o endereço localhost, porta 3306 e usuário root (sem senha).