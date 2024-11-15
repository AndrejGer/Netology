# Домашнее задание к занятию «Индексы» `Герасимчук Андрей`

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

### Задание 1

Напишите запрос к учебной базе данных, который вернёт процентное отношение общего размера всех индексов к общему размеру всех таблиц.

```sql
SELECT SUM(data_length), SUM(index_length), CONCAT(SUM(index_length)*100/SUM(data_length), '%') AS 'percent'
FROM INFORMATION_SCHEMA.TABLES

```

![1](https://github.com/AndrejGer/Netology/blob/main/SQL/image/3/1.PNG)


### Задание 2

Выполните explain analyze следующего запроса:
```sql
select distinct concat(c.last_name, ' ', c.first_name), sum(p.amount) over (partition by c.customer_id, f.title)
from payment p, rental r, customer c, inventory i, film f
where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id
```
- перечислите узкие места;
- оптимизируйте запрос: внесите корректировки по использованию операторов, при необходимости добавьте индексы.

### Решение 2

Explain analyze изначального запроса показал очень долгое время возврата всех строк (actual time=146e-6..172e-6), высокую стоимость исполнения запроса (cost=250e-6), а также избыточное колличество циклов (loops=642000)

![6](https://github.com/AndrejGer/Netology/blob/main/SQL/image/3/6.PNG)


Для оптимизации запроса следует исключить избыточные таблицы film, rental, inventory.
Заменить операторы distinct, partition by на опреторы JOIN и GROUP BY.
А также отредактировать оператор where, исключив из него лишние условия.

В итоге получается следующий запрос:

```sql
select concat(c.last_name, ' ', c.first_name), sum(p.amount)
from customer c
JOIN payment p ON c.customer_id = p.customer_id
where date(p.payment_date) = '2005-07-30'
GROUP BY concat(c.last_name, ' ', c.first_name)

```

С аналогичным выводом

![7](https://github.com/AndrejGer/Netology/blob/main/SQL/image/3/7.PNG)


С помощью оптимизации удалось добиться существенного сокращения времени вовзрата первой строки и всех строк (actual time=0.0422..0.046), 
а также в несколько раз снизились показатели количества циклов запроса и ориентировочная стоимость исполнения запроса (cost=6.89, loops=599)

![3](https://github.com/AndrejGer/Netology/blob/main/SQL/image/3/3.PNG)


Добавим индекс в поле payment_date:

```sql
CREATE INDEX payment_index ON payment(payment_date);
```

![8](https://github.com/AndrejGer/Netology/blob/main/SQL/image/3/8.PNG)


Получаем еще небольшой прирост в производительности:

![5](https://github.com/AndrejGer/Netology/blob/main/SQL/image/3/5.PNG)


### Доработка

Переписал условие where для payment_date, чтобы индекс работал правильно и время отклика сократилось:

```sql
EXPLAIN ANALYZE
select concat(c.last_name, ' ', c.first_name), sum(p.amount)
from customer c
JOIN payment p ON c.customer_id = p.customer_id
where payment_date >= '2005-07-30' and payment_date < DATE_ADD('2005-07-30', INTERVAL 1 DAY)
GROUP BY concat(c.last_name, ' ', c.first_name)
```
![9](https://github.com/AndrejGer/Netology/blob/main/SQL/image/3/9.PNG)



После добавления воторого JOIN удалось еще немного снизить актуальное время и стоимость запроса:

```sql
EXPLAIN ANALYZE
select concat(c.last_name, ' ', c.first_name), sum(p.amount)
from customer c
JOIN payment p ON c.customer_id = p.customer_id
JOIN rental r ON r.rental_id = p.rental_id
where payment_date >= '2005-07-30' and payment_date < DATE_ADD('2005-07-30', INTERVAL 1 DAY) and p.payment_date = r.rental_date
GROUP BY concat(c.last_name, ' ', c.first_name)
```

![10](https://github.com/AndrejGer/Netology/blob/main/SQL/image/3/10.PNG)




## Дополнительные задания (со звёздочкой*)
Эти задания дополнительные, то есть не обязательные к выполнению, и никак не повлияют на получение вами зачёта по этому домашнему заданию. Вы можете их выполнить, если хотите глубже шире разобраться в материале.

### Задание 3*

Самостоятельно изучите, какие типы индексов используются в PostgreSQL. Перечислите те индексы, которые используются в PostgreSQL, а в MySQL — нет.

*Приведите ответ в свободной форме.*

`Индексы, которые используются в PostgreSQL, а в MySQL — нет.`

Bitmap index - особый вид индекса базы данных, который использует растровые изображения.

Partial index — индекс, к которому применяется некоторое условие, так что он включает подмножество строк в таблице. Поддерживаtтся в PostgreSQL начиная с версии 7.2.

Function based index - функциональные индексы, ключи которых хранят результат пользовательских функций.

Базовые описания индексов Postgresql в целом соответствуют Mysql, а так же дают расширенные возможности. Особняком стоят индексы общего назначения GIN и GiST

GIN - Generalized Inverted Index - индекс общего назначения, предназначен для работы со сложными композитными типами

GiST - Generalized Search Tree - так же индекс общего назначения, работает с такими типами данных, как box, circle, inet,cidr,point,polygon, tsquery, tsvector а так же типы, которые поддерживают диапазоны значений.

В общем и целом, использовать GIN и GiST следует с осторожностью, т.к запись в такие индексы, и обращение к ним куда дороже, чем b-tree.
