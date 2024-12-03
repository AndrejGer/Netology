# Домашнее задание к занятию «Уязвимости и атаки на информационные системы» `Герасимчук Андрей`

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

### Задание 1

Скачайте и установите виртуальную машину Metasploitable: https://sourceforge.net/projects/metasploitable/.

Это типовая ОС для экспериментов в области информационной безопасности, с которой следует начать при анализе уязвимостей.

Просканируйте эту виртуальную машину, используя **nmap**.

Попробуйте найти уязвимости, которым подвержена эта виртуальная машина.

Сами уязвимости можно поискать на сайте https://www.exploit-db.com/.

Для этого нужно в поиске ввести название сетевой службы, обнаруженной на атакуемой машине, и выбрать подходящие по версии уязвимости.

Ответьте на следующие вопросы:

- Какие сетевые службы в ней разрешены?
- Какие уязвимости были вами обнаружены? (список со ссылками: достаточно трёх уязвимостей)
  
*Приведите ответ в свободной форме.*  

Подключение к Metasploitable:

![1](https://github.com/AndrejGer/Netology/blob/main/Metasploitable/13-01/1.PNG)

Сканирование ВМ `nmap -sV 192.168.0.111`

![2](https://github.com/AndrejGer/Netology/blob/main/Metasploitable/13-01/2.PNG)


Разрешенные сетевые службы и обнаруженные уязвимости:  

21/tcp   open  ftp         vsftpd 2.3.4  
`vsftpd 2.3.4 - Backdoor Command Execution https://www.exploit-db.com/exploits/49757`

22/tcp   open  ssh         OpenSSH 4.7p1 Debian 8ubuntu1 (protocol 2.0)  
23/tcp   open  telnet      Linux telnetd  
25/tcp   open  smtp        Postfix smtpd  
`Postfix SMTP 4.2.x < 4.2.48 - 'Shellshock' Remote Command Injection https://www.exploit-db.com/exploits/34896`

53/tcp   open  domain      ISC BIND 9.4.2  
`ISC BIND 9 - Denial of Service https://www.exploit-db.com/exploits/40453`

80/tcp   open  http        Apache httpd 2.2.8 ((Ubuntu) DAV/2)  
111/tcp  open  rpcbind     2 (RPC #100000)  
139/tcp  open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)  
445/tcp  open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)  
512/tcp  open  exec        netkit-rsh rexecd  
513/tcp  open  login  
514/tcp  open  tcpwrapped  
1099/tcp open  java-rmi    GNU Classpath grmiregistry  
1524/tcp open  bindshell   Metasploitable root shell  
2049/tcp open  nfs         2-4 (RPC #100003)  
2121/tcp open  ftp         ProFTPD 1.3.1  
3306/tcp open  mysql       MySQL 5.0.51a-3ubuntu5  
5432/tcp open  postgresql  PostgreSQL DB 8.3.0 - 8.3.7  
5900/tcp open  vnc         VNC (protocol 3.3)  
6000/tcp open  X11         (access denied)  
6667/tcp open  irc         UnrealIRCd  
8009/tcp open  ajp13       Apache Jserv (Protocol v1.3)  
8180/tcp open  http        Apache Tomcat/Coyote JSP engine 1.1  


### Задание 2

Проведите сканирование Metasploitable в режимах SYN, FIN, Xmas, UDP.

Запишите сеансы сканирования в Wireshark.

Ответьте на следующие вопросы:

- Чем отличаются эти режимы сканирования с точки зрения сетевого трафика?
- Как отвечает сервер?

*Приведите ответ в свободной форме.*

**Тип сканирования -sS**
`nmap -sS 192.168.0.111` 

Хосту отправляется [SYN] пакет.  
Если удалённый хост отвечает пакетом с флагом [RST, ACK] значит порт закрыт.  
Если удалённый хост отвечает пакетом с флагом [SYN, ACK], значит порт открыт и готов установить соединение (прослушивается).  
Для обрыва начатого рукопожатия отправляется пакет [RST].  

![4](https://github.com/AndrejGer/Netology/blob/main/Metasploitable/13-01/4.PNG)

![3](https://github.com/AndrejGer/Netology/blob/main/Metasploitable/13-01/3.PNG)


**Тип сканирования -sF и -sX**
Ключевой особенностью является их способность незаметно обойти некоторые не учитывающие состояние (non-stateful) брандмауэры и роутеры с функцией пакетной фильтрации. Еще одним преимуществом является то, что они даже чуть более незаметны, чем SYN сканирование. Все же не надо на это полагаться - большинство современных IDS могут быть сконфигурированы на их обнаружение.

Эти типы сканирования работают по одной схеме, различия только в TCP флагах установленных в пакетах запросов.  
Если в ответ приходит RST пакет, то порт считается закрытым.  
Отсутствие ответа означает, что порт открыт.  
Порт помечается как фильтруется, если в ответ приходит ICMP ошибка о недостижимости  

`nmap -sF 192.168.0.111`    
Устанавливается только TCP FIN бит.

![5](https://github.com/AndrejGer/Netology/blob/main/Metasploitable/13-01/5.PNG)


`nmap -sX 192.168.0.111`  
Устанавливаются FIN, PSH и URG флаги.

![6](https://github.com/AndrejGer/Netology/blob/main/Metasploitable/13-01/6.PNG)


**Тип сканирования -sU**  
`nmap -sU 192.168.0.111` 

UDP сканирование работает путем посылки пустого (без данных) UDP заголовка на каждый целевой порт. Если в ответ приходит ICMP ошибка (тип 3, код 3), значит порт недоступен **(Port unreachable)**. Другие ICMP ошибки недостижимости (тип 3, коды 1, 2, 9, 10 или 13) указывают на то, что порт фильтруется. Иногда, служба будет отвечать UDP пакетом, указывая на то, что порт открыт. Если после нескольких попыток не было получено никакого ответа, то порт классифицируется как открыт|фильтруется. Это означает, что порт может быть открыт, или, возможно, пакетный фильтр блокирует его.  
Большой проблемой при UDP сканировании является его медленная скорость работы. Открытые и фильтруемые порты редко посылают какие-либо ответы, заставляя Nmap отправлять повторные запросы, на случай если пакеты были утеряны.

![7](https://github.com/AndrejGer/Netology/blob/main/Metasploitable/13-01/7.PNG)