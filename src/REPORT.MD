### Part 1. Удаленное конфигурирование узла через Ansible

Задание

- Создать с помощью Vagrant три машины: manager, node01, node02. Не устанавливать с помощью shell-скриптов docker при создании машин на Vagrant! Прокинуть порты node01 на локальную машину для доступа к пока еще не развернутому микросервисному приложению.

![alt text](img/1.png)

![alt text](img/2.png)

- Подготовить manager как рабочую станцию для удаленного конфигурирования.

Зашла на manager

vagrant ssh manager

Проверила подключение к node01 через ssh по приватной сети

![alt text](img/3.png)

Сгенерировала ssh-ключ для подключения к node01 из manager (без passphrase)

![alt text](img/4.png)

![alt text](img/6.png)

Скопировала на manager docker-compose файл и исходный код микросервисов

![alt text](img/5.png)

Установила Ansible на менеджер и создала папку ansible, в которой создала inventory-файл

![alt text](img/7.png)

![alt text](img/8.png)

![alt text](img/9.png)

Использовала модуль ping для проверки подключения через Ansible

![alt text](img/11.png)

![alt text](img/10.png)

- Написать первый плейбук для Ansible, который выполняет apt update, устанавливает docker, docker-compose, копирует compose-файл из manager'а и разворачивает микросервисное приложение.

![alt text](img/12.png)

![alt text](img/13.png)

- Прогнать заготовленные тесты через postman и удостовериться, что все они проходят успешно. В отчете отобразить результаты тестирования.

![alt text](img/14.png)

- Сформировать три роли 

роль application выполняет развертывание микросервисного приложения при помощи docker-compose;
apache устанавливает и запускает стандартный apache сервер;
postgres устанавливает и запускает postgres, создает базу данных с произвольной таблицей и добавляет в нее три произвольные записи.

![alt text](img/15.png)

Назначить первую роль node01 и вторые две роли node02, проверить postman-тестами работоспособность микросервисного приложения, удостовериться в доступности postgres и apache-сервера. Для Apache веб-страница должна открыться в браузере. Что касается PostgreSQL, необходимо подключиться с локальной машины и отобразить содержимое ранее созданной таблицы с данными.

![alt text](img/16.png)

![alt text](img/17.png)

![alt text](img/18.png)

![alt text](img/19.png)

![alt text](img/20.png)

![alt text](img/21.png)

### Part 2. Service Discovery

Задание

- Написать два конфигурационных файла для consul

* consul_server.hcl:

настроить агент как сервер;
указать в advertise_addr интерфейс, направленный во внутреннюю сеть Vagrant;


* consul_client.hcl:

настроить агент как клиент;
указать в advertise_addr интерфейс, направленный во внутреннюю сеть Vagrant.


![alt text](img/22.png)

![alt text](img/23.png)

- Создать с помощью Vagrant четыре машины: consul_server, api, manager и db.

Прокинуть порт 8082 с api на локальную машину для доступа к пока еще не развернутому api.
Прокинуть порт 8500 с consul_server для доступа к ui consul.

![alt text](img/24.png)

![alt text](img/26.png)

- Написать плейбук для ansible и четыре роли:

install_consul_server
install_consul_client
install_db
install_hotels_service

![alt text](img/25.png)

![alt text](img/27.png)

![alt text](img/28.png)

![alt text](img/29.png)

![alt text](img/30.png)

- Проверить работоспособность CRUD-операций над сервисом отелей. В отчете отобразить результаты тестирования.



