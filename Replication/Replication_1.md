# Домашнее задание к занятию «Репликация и масштабирование. Часть 1» `Герасимчук Андрей`

### Инструкция по выполнению домашнего задания

1. Сделайте fork [репозитория c шаблоном решения](https://github.com/netology-code/sys-pattern-homework) к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/gitlab-hw или https://github.com/имя-вашего-репозитория/8-03-hw).
2. Выполните клонирование этого репозитория к себе на ПК с помощью команды `git clone`.
3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
   - впишите вверху название занятия и ваши фамилию и имя;
   - в каждом задании добавьте решение в требуемом виде: текст/код/скриншоты/ссылка;
   - для корректного добавления скриншотов воспользуйтесь инструкцией [«Как вставить скриншот в шаблон с решением»](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md);
   - при оформлении используйте возможности языка разметки md. Коротко об этом можно посмотреть в [инструкции по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md).
4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`).
5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
6. Любые вопросы задавайте в чате учебной группы и/или в разделе «Вопросы по заданию» в личном кабинете.

Желаем успехов в выполнении домашнего задания.

---

### Задание 1

На лекции рассматривались режимы репликации master-slave, master-master, опишите их различия.

*Ответить в свободной форме.*

При использовании репликации Master-Slave на Master ноде данные поступают, с ними можно выполнять любые операции (добавлять, удалять, изменять) и все изменения Slave нода будет забирать себе.
Если на Slave ноде выполнить любой из запросов (удаление, добавление или изменение), то данные не попадут на Master.

При репликации в виде Master-Master данные попавшие на ноды, будут синхронизироваться между собой.
Master-Master репликация — это обычная Master-Slave репликация, только в обе стороны (каждый сервер является мастером и слейвом одновременно).


---

### Задание 2

Выполните конфигурацию master-slave репликации, примером можно пользоваться из лекции.

*Приложите скриншоты конфигурации, выполнения работы: состояния и режимы работы серверов.*

Конфигурация файл my.cnf на Master сервере:

![1](https://github.com/AndrejGer/Netology/blob/main/Replication/img/1.png)

Конфигурационный файл my.cnf на Slave сервере:

![2](https://github.com/AndrejGer/Netology/blob/main/Replication/img/2.png)

Состояние работы Master сервера:

![3](https://github.com/AndrejGer/Netology/blob/main/Replication/img/3.png)

Просмотр репликации:

![4](https://github.com/AndrejGer/Netology/blob/main/Replication/img/4.png)

После создания БД на Master сервере она реплецируется на Slave сервер.

![5](https://github.com/AndrejGer/Netology/blob/main/Replication/img/5.png)


---

## Дополнительные задания (со звёздочкой*)
Эти задания дополнительные, то есть не обязательные к выполнению, и никак не повлияют на получение вами зачёта по этому домашнему заданию. Вы можете их выполнить, если хотите глубже шире разобраться в материале.

---

### Задание 3* 

Выполните конфигурацию master-master репликации. Произведите проверку.

*Приложите скриншоты конфигурации, выполнения работы: состояния и режимы работы серверов.*


На первом сервере настраиваем репликацию:
```
stop slave;
CHANGE MASTER TO MASTER_HOST = 'replication-master2', MASTER_USER = 'replica', MASTER_PASSWORD = '123456', MASTER_LOG_FILE = 'mysql-bin.000008', MASTER_LOG_POS = 342;
start slave;
```

![7](https://github.com/AndrejGer/Netology/blob/main/Replication/img/7.png)

И на втором сервере:
```
stop slave;
CHANGE MASTER TO MASTER_HOST = 'replication-master1', MASTER_USER = 'replica', MASTER_PASSWORD = '123456', MASTER_LOG_FILE = 'mysql-bin.000008', MASTER_LOG_POS = 342;
start slave;
```

![8](https://github.com/AndrejGer/Netology/blob/main/Replication/img/8.png)


Проверка работы репликации master-master с созданием и удалнием БД на двух серверах:

![6](https://github.com/AndrejGer/Netology/blob/main/Replication/img/6.png)

Меняем данные на server-master:

docker exec -it replication-master1 mysql -p
mysql> CREATE database world;
mysql> SHOW databases;
mysql> USE world;
mysql> Create table city (Name CHAR(50), CountryCode CHAR(50), District CHAR(50), Population INT);
mysql> INSERT INTO city (Name, CountryCode, District, Population) VALUES ('Test-Replication', 'ALB', 'Test', 42);

Проверяем на втором master:

docker exec -it replication-master2 mysql -p
mysql> SHOW databases;
mysql> USE world;
mysql> SHOW tables;
mysql> SELECT * FROM city;

![9](https://github.com/AndrejGer/Netology/blob/main/Replication/img/9.png)