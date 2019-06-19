# Docker Compose Laravel MariaDB

## Introdução

Ambiente completo para de desenvolvimento com Laravel, utilizando microserviços em Docker. Abaixo, temos as aplicações que fazem parte no ambiente:

* [Docker](https://www.docker.com)
* [Nginx](http://nginx.org)
* [PHP 7](https://php-fpm.org)
* [Laravel](https://laravel.com)
* [MariaDB](https://mariadb.org)
* [phpMyAdmin](https://www.phpmyadmin.net)
* [MailHog](https://github.com/mailhog/MailHog)


Para criação do nosso ambiente, será necessário que o Docker e o Docker Compose estejam instalados no nosso sistema Linux.


### Instalação Docker

```bash
$ sudo curl -fsSl https://get.docker.com | bash
```


### Instalação Docker Compose

```bash
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod 755 /usr/local/bin/docker-compose
```


### Clonando repositório

```bash
$ mkdir ~/App && cd ~/App
$ git clone https://github.com/RasecRapsag/docker-compose-laravel-mariadb
$ cd docker-compose-laravel-mariadb/
```


### Configurando ambiente

No arquivo .env definimos algumas configurações do nosso ambiente:

```bash
APP_DIR=./code
APP_USER=user
APP_USER_HOME=/tmp/home
APP_TIMEZONE=America/Sao_Paulo

DOCKER_ETC=./etc/docker
DOCKER_PHP=Dockerfile.php-fpm
DOCKER_CONSOLE=Dockerfile.console

NGINX_VERSION=1.17.0
NGINX_NAME=web
NGINX_PORT=80
NGINX_CONF=./etc/default.conf

MARIADB_VERSION=10.4.5
MARIADB_NAME=db
MARIADB_PORT=3306
MARIADB_USER=user
MARIADB_PASSWORD=123456
MARIADB_DB=teste
MARIADB_DATA=./data

MYADMIN_VERSION=4.9
MYADMIN_NAME=myadmin
MYADMIN_USER=root
```

Abaixo temos as configurações mais importantes:

- APP_DIR

Define a pasta que ficará o código do Laravel.

- APP_USER

Define o seu usuário utilizado no Linux e Mac, com isso todo o conteúdo gerado no console já terá permissão de escrita, não sendo necessário usar chown.

- APP_USER_HOME

Define local do diretório home do usuário do console, assim, arquivos gerados na utilização do console irá persistir.

- APP_TIMEZONE

Define o timezone do console e da aplicação no Laravel.

- NGINX_PORT

Define a porta de acesso da aplicação pelo browser.

- MARIADB_USER

Define o usuário para acesso ao banco pela aplicação Laravel.

- MARIADB_PASSWORD

Define a senha para acesso ao MariaDB.

- MARIADB_DB

Define o nome do banco de dados para aplicação Laravel.

- MARIADB_DATA

Define a pasta onde ficarão os arquivos do MariaDB.

- MYADMIN_USER

Define o usuário de acesso ao phpMyAdmin.


### Subindo os serviços

```bash
$ docker-compose up -d
```

### Acesso as interfaces web

* Laravel: (http://localhost)
* phpMyAdmin: (http://localhost:8080)
* MailHog: (http://localhost:8025)



## Comandos

Criei alguns atalhos para manipular os serviços definidos no docker-compose.

> **Nota**:
>
> Os comandos abaixo foram testados no Linux e no MacOS, e será necessário instalar o pacote make para funcionar. No Windows terá que utilizar os comandos do docker-compose que se encontram no arquivo Makefile.


- Para subir os serviços

```bash
$ make up
```

- Para derrubar os serviços

```bash
$ make down
```

- Para dar restart nos serviços

```bash
$ make restart
```

- Para listar os serviços

```bash
$ make ps
```

- Para verificar os logs

```bash
$ make logs
```

- Para acessar o console do MariaDB

```bash
$ make mysql
```

- Para acessar o console (executar comandos do Laravel)

```bash
$ make console
```



## Comandos no console

Dentro do console podemos utilizar alguns comandos, abaixo temos alguns exemplos:


- Cria um projeto Laravel no diretório /code que foi definido em APP_DIR

```bash
$ create-laravel
```

- Acessa o shell do MariaDB

```bash
$ mysql-cli
```

- Executando funções do Laravel

```bash
$ php artisan migrate
```

- Utilizando o Gerenciador de Dependências do PHP

```bash
$ composer require "laravelcollective/html":"^5.4.0"
```

- Utilizando o Gerenciador de Pacotes do Node

```bash
$ npm install vuex
```

- Utilizando o Controlador de Versão Git

```bash
$ git init
```
