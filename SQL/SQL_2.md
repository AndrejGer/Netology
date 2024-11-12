# Домашнее задание к занятию «SQL. Часть 2» `Герасимчук Андрей`

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

Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию: 
- фамилия и имя сотрудника из этого магазина;
- город нахождения магазина;
- количество пользователей, закреплённых в этом магазине.

```sql
SELECT COUNT(c.customer_id) AS amount_customer, ci.city, CONCAT(st.first_name, ' ', st.last_name) AS staff_name
FROM store s
INNER JOIN staff st ON st.staff_id = s.manager_staff_id
INNER JOIN address a ON st.address_id = a.address_id
INNER JOIN city ci ON ci.city_id = a.city_id
INNER JOIN customer c ON c.store_id = s.store_id
GROUP BY s.store_id
HAVING COUNT(c.customer_id) > 300;

```

![1](https://github.com/AndrejGer/Netology/blob/main/SQL/image/2/1.PNG)


### Задание 2

Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.

```sql
SELECT COUNT(title) FROM film
WHERE length > (SELECT AVG(length) FROM film);

```

![2](https://github.com/AndrejGer/Netology/blob/main/SQL/image/2/2.PNG)

### Задание 3

Получите информацию, за какой месяц была получена наибольшая сумма платежей, и добавьте информацию по количеству аренд за этот месяц.

```sql
SELECT DATE_FORMAT(payment_date, '%M') AS Month, SUM(amount), COUNT(payment_date) FROM payment  
GROUP BY DATE_FORMAT(payment_date, '%M')
ORDER BY SUM(amount) DESC LIMIT 1;

```

![3](https://github.com/AndrejGer/Netology/blob/main/SQL/image/2/3.PNG)


## Дополнительные задания (со звёздочкой*)
Эти задания дополнительные, то есть не обязательные к выполнению, и никак не повлияют на получение вами зачёта по этому домашнему заданию. Вы можете их выполнить, если хотите глубже шире разобраться в материале.

### Задание 4*

Посчитайте количество продаж, выполненных каждым продавцом. Добавьте вычисляемую колонку «Премия». Если количество продаж превышает 8000, то значение в колонке будет «Да», иначе должно быть значение «Нет».

```sql
SELECT staff_id, COUNT(payment_id),
CASE
 WHEN COUNT(payment_id) > 8000 THEN 'ДА'
 WHEN COUNT(payment_id) < 8000 THEN 'НЕТ'
END AS Premium
FROM payment
GROUP BY staff_id

```

![4](https://github.com/AndrejGer/Netology/blob/main/SQL/image/2/4.PNG)


### Задание 5*

Найдите фильмы, которые ни разу не брали в аренду.

```sql
SELECT f.film_id, title
FROM film f
LEFT JOIN inventory i ON i.film_id = f.film_id
WHERE i.film_id IS NULL;

```

![5](https://github.com/AndrejGer/Netology/blob/main/SQL/image/2/5.PNG)