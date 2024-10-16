# Домашнее задание к занятию «Базы данных, их типы» `Герасимчук Андрей`

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

### Задание 1. СУБД

### Кейс
Крупная строительная компания, которая также занимается проектированием и девелопментом, решила создать 
правильную архитектуру для работы с данными. Ниже представлены задачи, которые необходимо решить для
каждой предметной области. 

Какие типы СУБД, на ваш взгляд, лучше всего подойдут для решения этих задач и почему? 
 
1.1. Бюджетирование проектов с дальнейшим формированием финансовых аналитических отчётов и прогнозирования рисков.
СУБД должна гарантировать целостность и чёткую структуру данных.

` Подойдут реляционные СУБД MySQL или PostgreSQL, т.к. они лучше всего работают с данными структурированной природы и имеют строгую схему данных. `

1.1.* Хеширование стало занимать длительно время, какое API можно использовать для ускорения работы? 

` Можно использовать Redis и различные библиотеки для кэширования `

1.2. Под каждый девелоперский проект создаётся отдельный лендинг, и все данные по лидам стекаются в CRM к 
маркетологам и менеджерам по продажам. Какой тип СУБД лучше использовать для лендингов и для CRM? 
СУБД должны быть гибкими и быстрыми.

` Для лендинга лучше всего подойдёт документо-ориентированная NoSQL база данных, например MongoDB и CouchDB. Они предлагают гибкость схемы, быстрое выполнение запросов и масштабируемость. `
` Для CRМ реляционные БД MySQL или PostgreSQL`

1.2.* Можно ли эту задачу закрыть одной СУБД? И если да, то какой именно СУБД и какой реализацией?

` Можно использовать реляционную БД PostgreSQL, она обладает широким функционалом и подходит для решения широкого спектра задач благодаря гибкости, производительности и надежности системы. `

1.3. Отдел контроля качества решил создать базу по корпоративным нормам и правилам, обучающему материалу 
и так далее, сформированную согласно структуре компании. СУБД должна иметь простую и понятную структуру.

` Подойдут документо-ориентированные СУБД, которые имеют простую структуру, например MongoDB`

1.4. Департамент логистики нуждается в решении задач по быстрому формированию маршрутов доставки материалов 
по объектам и распределению курьеров по маршрутам с доставкой документов. СУБД должна уметь быстро работать
со связями.

` Для этих целей подойдёт NoSQL БД, графового типа, например Neo4j, Amazon Neptune, InfiniteGraph, InfoGrid, которые умеют быстро работать со связями. `

1.5.* Можно ли все перечисленные выше задачи решить, используя одну СУБД? Если да, то какую именно?

` Для всех целей можно использовать СУБД PostgreSQL, она обладает расширенными возможностями, обеспечивает целостность и структурность данных, а также имеет поддержку графовых баз данных для обработки связей между объектами. `

*Приведите ответ в свободной форме.*

---

### Задание 2. Транзакции

2.1. Пользователь пополняет баланс счёта телефона, распишите пошагово, какие действия должны произойти для того, чтобы 
транзакция завершилась успешно. Ориентируйтесь на шесть действий.

`1. Инициация или поступление запроса на оплату счета.` 
`2. Авторизация, то есть проверка достоверности данных, доступности средств на счете и подтверждение легитимности операции. `
`3. Обработка и маршрутизация происходит в случае успешной проверки данных. Затем информация передается по соответствующей платежной инфраструктуре.`
`4. Расчет и согласование — определение окончательных сумм с учетом комиссий, конверсий и других финансовых аспектов.`
`5. Завершение транзакции сопровождается сохранением данных в системе.`
`6. Участники транзакции получают подтверждения и уведомления о проведенной сделке: это могут быть квитанции, электронные чеки, пуш или смс-уведомления.`

*Приведите ответ в свободной форме.*

---

### Задание 3. SQL vs NoSQL

3.1. Напишите пять преимуществ SQL-систем по отношению к NoSQL. 

`Хорошо структурированные запросы: Базы данных SQL используют структурированный язык запросов, что делает его идеальным для сложных задач обработки данных.`

`SQL обычно соответствуют свойствам ACID (атомарность, согласованность, изоляция, долговечность), гарантируя согласованность и надёжность транзакций. Это делает их подходящими для приложений, требующих строгой согласованности данных.`

`Надежная целостность данных: базы данных SQL предоставляют механизмы обеспечения целостности данных. Эти функции помогают поддерживать качество и согласованность данных, снижая риск ошибок и несоответствий.`

`Совместимость с популярными языками программирования.: SQL совместим с популярными языками программирования, такими как Java, Python и C#.`

`Зрелая экосистема: базы данных SQL имеют зрелую экосистему с надежными инструментами, документацией и поддержкой сообщества. Разработчики имеют доступ к широкому спектру фреймворков, библиотек и ресурсов для создания и поддержки приложений на основе SQL.`


3.1.* Какие, на ваш взгляд, преимущества у NewSQL систем перед SQL и NoSQL.

`NewSQL улучшает SQL, обеспечивая скорость, горизонтальную масштабируемость, гибкость баз данных NoSQL и сохраняя при этом свойства ACID. Таким образом, NewSQL является золотой серединой между скоростью, масштабируемостью, согласованностью и доступностью. Системы NewSQL, такие как CockroachDB, Google Spanner и NuoDB, сейчас набирают популярность в индустрии электронной коммерции.`


*Приведите ответ в свободной форме.*

---

### Задание 4. Кластеры

Необходимо производить большое количество вычислений при работе с огромным количеством данных, под эту задачу 
выделено 1000 машин. 

На основе какого критерия будете выбирать тип СУБД и какая модель *распределённых вычислений* 
здесь справится лучше всего и почему?

*Приведите ответ в свободной форме.*

`СУБД для больших данных должны быть способны обрабатывать данные в распределенной среде, где данные хранятся на множестве серверов и обрабатываются параллельно. Это позволяет значительно увеличить производительность и масштабируемость системы. Кроме того, такие СУБД должны обеспечивать высокую доступность и отказоустойчивость. `
`Для этих задач подойдут Apache Hadoop, который включает в себя распределенную файловую систему (HDFS) и модель распределённых вычислений для больших данных — MapReduce, которая ориентирована на параллельные вычисления в распределённых кластерах, а также Apache Cassandra, MongoDB, Apache HBase, Amazon Redshift.`


---

Задания,помеченные звёздочкой, — дополнительные, то есть не обязательные к выполнению, и никак не повлияют на получение вами зачёта по этому домашнему заданию. Вы можете их выполнить, если хотите глубже разобраться в материале.
