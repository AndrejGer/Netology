# Домашнее задание к занятию «Защита сети» `Герасимчук Андрей`

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

------

### Подготовка к выполнению заданий

1. Подготовка защищаемой системы:

- установите **Suricata**,
- установите **Fail2Ban**.

2. Подготовка системы злоумышленника: установите **nmap** и **thc-hydra** либо скачайте и установите **Kali linux**.

Обе системы должны находится в одной подсети.

По желанию можете поэкспериментировать с опциями: https://nmap.org/man/ru/man-briefoptions.html.

*В качестве ответа пришлите события, которые попали в логи Suricata и Fail2Ban, прокомментируйте результат.*


------

### Задание 1

Проведите разведку системы и определите, какие сетевые службы запущены на защищаемой системе:

**sudo nmap -sA 192.168.0.160**

![1](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/sA.PNG)


**sudo nmap -sT 192.168.0.160**

![2](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/sT.PNG)

![3](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/sT-log.PNG)


**sudo nmap -sS 192.168.0.160**

![4](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/sS.PNG)

![5](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/sS-log.PNG)


**sudo nmap -sV 192.168.0.160**

![6](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/sV.PNG)

![7](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/sV-log.PNG)


**/var/log/fail2ban.log** не показал ничего, так как при сканировании не выполнялся процесс аутентификации.

![8](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/2ban1.PNG)


**/var/log/suricata/fast.log** сообщил о потенциально плохом трафике и попытках сканирования открытых портов (Suspicious inbound), 
для последующего взлома.

**Priority 2**: Средний уровень угрозы. Эти события требуют внимания, но не всегда свидетельствуют о прямой атаке.  
Classification:  
**Misc Attack**: Общая категория для подозрительных действий.  
**Potentially Bad Traffic**: Потенциально вредоносный трафик, например, попытки сканирования или тестирования уязвимостей. 
Эта категория правил охватывает трафик, который явно отличается от обычного и потенциально указывает на взлом системы.   
**Attempted Information Leak**: относится к сигнатурам потенциально опасных попыток сбора информации. 
Скорее, это сигнал о том, что попытка была предпринята и что при наличии подходящих условий была раскрыта конфиденциальная информация, 
которая может помочь злоумышленнику скомпрометировать систему.   
**Web-application attack**: Такие атаки связаны с различными попытками деструктивного воздействия на веб-приложения, которые находятся внутри информационной системы: SQL-инъекции, кросс-сайтовые атаки (XSS), атаки на аутентификацию, подделки межсайтовых запросов (CSRF) и так
далее.


------

### Задание 2

Проведите атаку на подбор пароля для службы SSH:

**hydra -L users.txt -P pass.txt < ip-адрес > ssh**

1. Настройка **hydra**: 
 
 - создайте два файла: **users.txt** и **pass.txt**;
 - в каждой строчке первого файла должны быть имена пользователей, второго — пароли. В нашем случае это могут быть случайные строки, но ради эксперимента можете добавить имя и пароль существующего пользователя.

Дополнительная информация по **hydra**: https://kali.tools/?p=1847.

2. Включение защиты SSH для Fail2Ban:

-  открыть файл /etc/fail2ban/jail.conf,
-  найти секцию **ssh**,
-  установить **enabled**  в **true**.

Дополнительная информация по **Fail2Ban**:https://putty.org.ru/articles/fail2ban-ssh.html.


*В качестве ответа пришлите события, которые попали в логи Suricata и Fail2Ban, прокомментируйте результат.*

создание файлов: **user.txt** и **pass.txt**;

![9](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/user_pass.PNG)

`Результат атаки при выключенном Fail2Ban:`

![10](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/hydra_off.PNG)

![11](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/hydra_off2.PNG)

![12](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/hydra_off3.PNG)

![13](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/hydra_off4.PNG)

Атака была закончена, но подходящих логинов и паролей не было найдено.


`Результат атаки при активном Fail2Ban:`

![14](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/hydra_on.PNG)

![15](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/hydra_on2.PNG)

![16](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/hydra_on3.PNG)

![17](https://github.com/AndrejGer/Netology/blob/main/Suricata/suricata2/hydra_on4.PNG)

Подбор логинов и паролей, результат работы hydra выдал ошибку connection refused.  
В /var/log/fail2ban.log появились записи о нелегитимных попытках подбора логина и пароля с адреса 192.168.0.157 и последующей блокировке.  
В логе файла /var/log/auth.log видна операция подбора пароля.  
/var/log/suricata/fast.log показывает ET SCAN Potential SSH Scan OUTBOUND, сработавшее правило может быть признаком сканирования, попытки подбора паролей, либо признаком ошибки соединения.