# Домашнее задание к занятию «GitLab» `Герасимчук Андрей`

### Инструкция по выполнению домашнего задания

   1. Сделайте `fork` [репозитория c шаблоном решения](https://github.com/netology-code/sys-pattern-homework) к себе в GitHub и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/gitlab-hw или https://github.com/имя-вашего-репозитория/8-03-hw.
   2. Выполните клонирование этого репозитория к себе на ПК с помощью команды `git clone`.
   3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
      - впишите сверху название занятия, ваши фамилию и имя;
      - в каждом задании добавьте решение в требуемом виде — текст, код, скриншоты, ссылка.
      - для корректного добавления скриншотов используйте [инструкцию «Как вставить скриншот в шаблон с решением»](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md);
      - при оформлении используйте возможности языка разметки md. Коротко об этом можно посмотреть в [инструкции  по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md).
   4. После завершения работы над домашним заданием сделайте коммит `git commit -m "comment"` и отправьте его на GitHub `git push origin`.
   5. Для проверки домашнего задания в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем GitHub.
   6. Любые вопросы по выполнению заданий задавайте в чате учебной группы или в разделе «Вопросы по заданию» в личном кабинете.
   
Желаем успехов в выполнении домашнего задания!

---

### Задание 1

**Что нужно сделать:**

1. Разверните GitLab локально, используя Vagrantfile и инструкцию, описанные в [этом репозитории](https://github.com/netology-code/sdvps-materials/tree/main/gitlab).   
2. Создайте новый проект и пустой репозиторий в нём.

![1](https://github.com/AndrejGer/Netology/blob/main/Gitlab/img/lab/1.PNG)

3. Зарегистрируйте gitlab-runner для этого проекта и запустите его в режиме Docker. Раннер можно регистрировать и запускать на той же виртуальной машине, на которой запущен GitLab.

В качестве ответа в репозиторий шаблона с решением добавьте скриншоты с настройками раннера в проекте.

![2](https://github.com/AndrejGer/Netology/blob/main/Gitlab/img/lab/2.PNG)

![3](https://github.com/AndrejGer/Netology/blob/main/Gitlab/img/lab/3.PNG)

![4](https://github.com/AndrejGer/Netology/blob/main/Gitlab/img/lab/4.PNG)

![5](https://github.com/AndrejGer/Netology/blob/main/Gitlab/img/lab/5.PNG)

---

### Задание 2

**Что нужно сделать:**

1. Запушьте [репозиторий](https://github.com/netology-code/sdvps-materials/tree/main/gitlab) на GitLab, изменив origin. Это изучалось на занятии по Git.
2. Создайте .gitlab-ci.yml, описав в нём все необходимые, на ваш взгляд, этапы.

В качестве ответа в шаблон с решением добавьте: 
   
 * файл gitlab-ci.yml для своего проекта или вставьте код в соответствующее поле в шаблоне; 
 * скриншоты с успешно собранными сборками.
 
![6](https://github.com/AndrejGer/Netology/blob/main/Gitlab/img/lab/6.PNG)

![7](https://github.com/AndrejGer/Netology/blob/main/Gitlab/img/lab/7.PNG)

![9](https://github.com/AndrejGer/Netology/blob/main/Gitlab/img/lab/9.PNG)

![10](https://github.com/AndrejGer/Netology/blob/main/Gitlab/img/lab/10.PNG)

```
stages:
  - test
  - build

test:
  stage: test
  image: golang:1.17
  script: 
   - go test .

build:
  stage: build
  image: docker:latest
  script:
   - docker build .

```

---
## Дополнительные задания* (со звёздочкой)

Их выполнение необязательное и не влияет на получение зачёта по домашнему заданию. Можете их решить, если хотите лучше разобраться в материале.

---

### Задание 3*

Измените CI так, чтобы:

 - этап сборки запускался сразу, не дожидаясь результатов тестов;
 - тесты запускались только при изменении файлов с расширением *.go.

В качестве ответа добавьте в шаблон с решением файл gitlab-ci.yml своего проекта или вставьте код в соответсвующее поле в шаблоне.

```
stages:
  - build
  - test

build:
  stage: build
  image: docker:latest
  script:
   - docker build .

test:
  stage: test
  image: golang:1.17
  rules:
    - changes:
      - "*.go"
  script:
    - go test .

```
![11](https://github.com/AndrejGer/Netology/blob/main/Gitlab/img/lab/11.PNG)

![12](https://github.com/AndrejGer/Netology/blob/main/Gitlab/img/lab/12.PNG)

При первом запуске был редактирован файл main_test.go, запустилась сборка и тест. Во втором случае был изменен файл README.md, произошла только сборка, без запуска теста.
