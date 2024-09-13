# Домашнее задание к занятию "`Git`" - `Герасимчук Андрей`


### Инструкция по выполнению домашнего задания

   1. Сделайте `fork` данного репозитория к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/git-hw или  https://github.com/имя-вашего-репозитория/7-1-ansible-hw).
   2. Выполните клонирование данного репозитория к себе на ПК с помощью команды `git clone`.
   3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
      - впишите вверху название занятия и вашу фамилию и имя
      - в каждом задании добавьте решение в требуемом виде (текст/код/скриншоты/ссылка)
      - для корректного добавления скриншотов воспользуйтесь [инструкцией "Как вставить скриншот в шаблон с решением](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md)
      - при оформлении используйте возможности языка разметки md (коротко об этом можно посмотреть в [инструкции  по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md))
   4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`);
   5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
   6. Любые вопросы по выполнению заданий спрашивайте в чате учебной группы и/или в разделе “Вопросы по заданию” в личном кабинете.
   
Желаем успехов в выполнении домашнего задания!
   
### Дополнительные материалы, которые могут быть полезны для выполнения задания

1. [Руководство по оформлению Markdown файлов](https://gist.github.com/Jekins/2bf2d0638163f1294637#Code)

---
### Задание 1

**Что нужно сделать:**

1. Зарегистрируйте аккаунт на [GitHub](https://github.com/).
2. Создайте публичный репозиторий. Обязательно поставьте галочку в поле «Initialize this repository with a README».
3. Склонируйте репозиторий, используя https протокол `git clone ...`.
4. Перейдите в каталог с клоном репозитория.
5. Произведите первоначальную настройку Git, указав своё настоящее имя и email: `git config --global user.name` и `git config --global user.email johndoe@example.com`.
6. Выполните команду `git status` и запомните результат.

![1](https://github.com/AndrejGer/Netology/blob/main/Git/img/git/1.PNG)

7. Отредактируйте файл README.md любым удобным способом, переведя файл в состояние Modified.

8. Ещё раз выполните `git status` и продолжайте проверять вывод этой команды после каждого следующего шага.

![image](https://github.com/AndrejGer/Netology/blob/main/Git/img/git/2.PNG)

9. Посмотрите изменения в файле README.md, выполнив команды `git diff` и `git diff --staged`.

![3](https://github.com/AndrejGer/Netology/blob/main/Git/img/git/3.PNG)

10. Переведите файл в состояние staged или, как говорят, добавьте файл в коммит, командой `git add README.md`.

![4](https://github.com/AndrejGer/Netology/blob/main/Git/img/git/4.PNG)

11. Ещё раз выполните команды `git diff` и `git diff --staged`.

![5](https://github.com/AndrejGer/Netology/blob/main/Git/img/git/5.PNG)

12. Теперь можно сделать коммит `git commit -m 'First commit'`.

![6](https://github.com/AndrejGer/Netology/blob/main/Git/img/git/6.PNG)

13. Сделайте ```git push origin master```.

![7](https://github.com/AndrejGer/Netology/blob/main/Git/img/git/7.PNG)

В качестве ответа добавьте ссылку на этот коммит в ваш md-файл с решением.

[First commit](https://github.com/AndrejGer/my-git/commit/5d15078fc8cbecfb8401878cb7a90ad0908b2b57)

---

### Задание 2

**Что нужно сделать:**

1. Создайте файл .gitignore (обратите внимание на точку в начале файла) и проверьте его статус сразу после создания.

2. Добавьте файл .gitignore в следующий коммит `git add...`.

![8](https://github.com/AndrejGer/Netology/blob/main/Git/img/git/88.PNG)

3. Напишите правила в этом файле, чтобы игнорировать любые файлы `.pyc`, а также все файлы в директории `cache`.

![9](https://github.com/AndrejGer/Netology/blob/main/Git/img/git/9.PNG)

4. Сделайте коммит и пуш.

![10](https://github.com/AndrejGer/Netology/blob/main/Git/img/git/10.PNG)

В качестве ответа добавьте ссылку на этот коммит в ваш md-файл с решением.

[commit .gitignore](https://github.com/AndrejGer/my-git/commit/7f97b937e5ea79ed01f2757596fb0521d9cb610f)


---

### Задание 3

**Что нужно сделать:**

1. Создайте новую ветку dev и переключитесь на неё.

![11](https://github.com/AndrejGer/Netology/blob/main/Git/img/git/11.PNG)

2. Создайте в ветке dev файл test.sh с произвольным содержимым.
3. Сделайте несколько коммитов и пушей в ветку dev, имитируя активную работу над файлом в процессе разработки.

![12](https://github.com/AndrejGer/Netology/blob/main/Git/img/git/12.PNG)

4. Переключитесь на основную ветку.
5. Добавьте файл main.sh в основной ветке с произвольным содержимым, сделайте комит и пуш . Так имитируется продолжение общекомандной разработки в основной ветке во время разработки отдельного функционала в dev ветке.

![13](https://github.com/AndrejGer/Netology/blob/main/Git/img/git/13.PNG)

6. Сделайте мердж dev ветки в основную с помощью git merge dev. Напишите осмысленное сообщение в появившееся окно комита.

![14](https://github.com/AndrejGer/Netology/blob/main/Git/img/git/14.PNG)

7. Сделайте пуш в основной ветке.
8. Не удаляйте ветку dev.

В качестве ответа прикрепите ссылку на граф коммитов https://github.com/ваш-логин/ваш-репозиторий/network в ваш md-файл с решением.

[граф коммитов](https://github.com/AndrejGer/my-git/network)


