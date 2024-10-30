# Домашнее задание к занятию «Работа с данными (DDL/DML)» `Герасимчук Андрей`

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

Задание можно выполнить как в любом IDE, так и в командной строке.

### Задание 1
1.1. Поднимите чистый инстанс MySQL версии 8.0+. Можно использовать локальный сервер или контейнер Docker.

![1](https://github.com/AndrejGer/Netology/blob/main/DDL_DML/img/1.png)

1.2. Создайте учётную запись sys_temp. 

```
CREATE USER 'sys_temp'@'109.71.177.41' IDENTIFIED BY 'admin';
```

1.3. Выполните запрос на получение списка пользователей в базе данных. (скриншот)

```
SELECT user FROM mysql.user;
```

![2](https://github.com/AndrejGer/Netology/blob/main/DDL_DML/img/2.png)

1.4. Дайте все права для пользователя sys_temp. 

```
GRANT ALL PRIVILEGES ON *.* TO 'sys_temp'@'109.71.177.41';
```

```
SHOW GRANTS FOR 'sys_temp'@'109.71.177.41';
```

1.5. Выполните запрос на получение списка прав для пользователя sys_temp. (скриншот)

![3](https://github.com/AndrejGer/Netology/blob/main/DDL_DML/img/3.png)

1.6. Переподключитесь к базе данных от имени sys_temp.

```
mysql -h 89.169.137.204 -u sys_temp -p
```

Для смены типа аутентификации с sha2 используйте запрос: 
```sql
ALTER USER 'sys_test'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```
1.6. По ссылке https://downloads.mysql.com/docs/sakila-db.zip скачайте дамп базы данных.

1.7. Восстановите дамп в базу данных.

```
source /home/xyden/sakila-db/sakila-schema.sql;
source /home/xyden/sakila-db/sakila-data.sql;
```

![4](https://github.com/AndrejGer/Netology/blob/main/DDL_DML/img/4.png)

![6](https://github.com/AndrejGer/Netology/blob/main/DDL_DML/img/6.png)

![7](https://github.com/AndrejGer/Netology/blob/main/DDL_DML/img/7.png)


1.8. При работе в IDE сформируйте ER-диаграмму получившейся базы данных. При работе в командной строке используйте команду для получения всех таблиц базы данных. (скриншот)

![33](https://github.com/AndrejGer/Netology/blob/main/DDL_DML/img2/33.PNG)

![34](https://github.com/AndrejGer/Netology/blob/main/DDL_DML/img2/34.PNG)

*Результатом работы должны быть скриншоты обозначенных заданий, а также простыня со всеми запросами.*


### Задание 2
Составьте таблицу, используя любой текстовый редактор или Excel, в которой должно быть два столбца: в первом должны быть названия таблиц восстановленной базы, во втором названия первичных ключей этих таблиц. Пример: (скриншот/текст)
```
Название таблицы | Название первичного ключа
customer         | customer_id
```

![35](https://github.com/AndrejGer/Netology/blob/main/DDL_DML/img2/35.PNG)

## Дополнительные задания (со звёздочкой*)
Эти задания дополнительные, то есть не обязательные к выполнению, и никак не повлияют на получение вами зачёта по этому домашнему заданию. Вы можете их выполнить, если хотите глубже шире разобраться в материале.

### Задание 3*
3.1. Уберите у пользователя sys_temp права на внесение, изменение и удаление данных из базы sakila.

Устанавливаем все привилегии на БД sakila для пользователя sys_temp:
```
GRANT ALL PRIVILEGES ON `sakila`.* TO 'sys_temp'@'109.71.177.41'WITH GRANT OPTION;
```

Удаляем у пользователя права на внесение, изменение и удаление данных из базы sakila:
```
REVOKE INSERT, UPDATE, DELETE ON `sakila`.* FROM 'sys_temp'@'109.71.177.41';
```

3.2. Выполните запрос на получение списка прав для пользователя sys_temp. (скриншот)

![8](https://github.com/AndrejGer/Netology/blob/main/DDL_DML/img/8.png)


*Результатом работы должны быть скриншоты обозначенных заданий, а также простыня со всеми запросами.*
