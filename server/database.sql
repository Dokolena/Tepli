CREATE DATABASE tepli;

CREATE TABLE users(
   user_id         SERIAL PRIMARY KEY
  ,user_name       VARCHAR(255)         NOT NULL UNIQUE
  ,user_password   VARCHAR(255)         NOT NULL
  ,is_admin        BOOLEAN              NOT NULL DEFAULT false
);

COMMENT ON TABLE users IS 'Пользователи';
COMMENT ON COLUMN users.user_id IS 'Идентификатор пользователя';
COMMENT ON COLUMN users.user_name IS 'Имя пользователя';
COMMENT ON COLUMN users.user_password IS 'Пароль пользователя';
COMMENT ON COLUMN users.is_admin IS 'Флаг, является ли пользователь администратором';

CREATE TABLE news(
   news_id         SERIAL PRIMARY KEY
  ,title           TEXT                 NOT NULL
  ,body            TEXT                 NOT NULL
  ,create_datetime TIMESTAMPTZ          DEFAULT NOW()
  ,state           TEXT                 DEFAULT 'enabled'
);

COMMENT ON TABLE news IS 'Новости';
COMMENT ON COLUMN news.news_id IS 'Идентификатор новости';
COMMENT ON COLUMN news.title IS 'Заголовок новости';
COMMENT ON COLUMN news.body IS 'Содержание новости';
COMMENT ON COLUMN news.create_datetime IS 'Дата и время создания новости';
COMMENT ON COLUMN news.state IS 'Статус новости';

CREATE TABLE images(
    image_id       SERIAL PRIMARY KEY
   ,news_id        INT REFERENCES news (news_id)
   ,img            JSONB
);

COMMENT ON TABLE images IS 'Картинки для новостей';
COMMENT ON COLUMN images.image_id  IS 'Идентификатор картинки';
COMMENT ON COLUMN images.news_id  IS 'Идентификатор новости';
COMMENT ON COLUMN images.img IS 'Имя картинки';

CREATE TABLE main_page_images(
    image_id        SERIAL PRIMARY KEY
   ,img             VARCHAR(255)
   ,create_datetime TIMESTAMPTZ          DEFAULT NOW()
);

COMMENT ON TABLE main_page_images IS 'Картинки для главной страницы';
COMMENT ON COLUMN main_page_images.image_id  IS 'Идентификатор картинки';
COMMENT ON COLUMN main_page_images.img  IS 'Имя картинки';
COMMENT ON COLUMN main_page_images.create_datetime IS 'Дата и время создания картинки';

CREATE TABLE about(
     about_id       SERIAL PRIMARY KEY
    ,body           TEXT                NOT NULL
);

COMMENT ON TABLE about IS 'Информация о компании';
COMMENT ON COLUMN about.about_id  IS 'Идентификатор абзаца информации о компании';
COMMENT ON COLUMN about.body IS 'Информация о компании';

CREATE TABLE price(
     price_id       SERIAL PRIMARY KEY
    ,price_name      VARCHAR(255)
    ,price_path      VARCHAR(255)       NOT NULL
);

COMMENT ON TABLE price IS 'Цены';
COMMENT ON COLUMN price.price_name  IS 'Наименование ссылки';
COMMENT ON COLUMN price.price_path IS 'Имя файла';

CREATE TABLE contacts (
  cont_id  SERIAL PRIMARY KEY
  ,data JSONB
);

COMMENT ON TABLE contacts IS 'Контакты';
COMMENT ON COLUMN contacts.cont_id  IS 'Идентификатор контактов';
COMMENT ON COLUMN contacts.data IS 'Информация о контактах в формате json';

INSERT INTO users (user_name, user_password) VALUES (
    'user', 'userpassword');
INSERT INTO users (user_name, user_password, is_admin) VALUES (
    'admin', '$2b$05$V9q/L6h6X8UQQpyEMYAs6uDy2Fdq3dxQ/1bfAPw7l.ITXXUolLjuG', true);

INSERT INTO news (title, body) VALUES ('proverka','proverkakartinok');
INSERT INTO images (news_id, img) VALUES (1, '["pathone"]');
INSERT INTO contacts (data) VALUES ('{
  "phone":
[
  {
    "id" : 1,
    "num" : "(499) 128 94 91"
  }
  ,{
    "id" : 2,
    "num" : "(499) 128 81 27"
  }
  ,{
    "id" : 3,
    "num" : "(499) 128 82 07"
  }
  ,{
    "id": 4,
    "num" : "+7 (999) 880 27 03"
  }
]
, "email":
[
  {
    "id" : 1,
    "ref" : "info@tepli.ru"
  }
]
, "network":
[
  {
    "id" : 1,
    "name" : "Facebook",
    "ref" :  "http://www.facebook.com"
  },
  {
    "id" : 2,
    "name" : "Youtube",
    "ref" : "http://www.youtube.com"
  },
  {
    "id": 3,
    "ref": "http://www.instagram.com",
    "name": "Instagram"
  },
  {
    "id": 4,
    "ref": "http://www.vk.com",
    "name": "Vk"
  },
  {
    "id": 5,
    "ref": "http://www.whatsapp.com",
    "name": "Whatsapp"
  },
  {
    "id": 6,
    "ref": "http://www.twitter.com",
    "name": "Twitter"
  }
]
}');

INSERT INTO main_page_images (img) VALUES ('d69ab00a-fe84-4425-acdd-e0794d1203c7.jpg');
INSERT INTO main_page_images (img) VALUES ('2563d3e1-b2f7-4a6d-88e9-0bd6a83cfbc2.jpg');
INSERT INTO main_page_images (img) VALUES ('65044516-4b80-4585-8126-bc0e5a4d3f06.jpg');
INSERT INTO main_page_images (img) VALUES ('05a59c7b-731b-4e28-afad-6da3c9061f46.jpg');
INSERT INTO main_page_images (img) VALUES ('72ec7219-905a-4e35-a7ab-afef9731deb4.jpg');
INSERT INTO main_page_images (img) VALUES ('8ec7509b-80e2-4642-b4e2-c46d11a36503.jpg');
INSERT INTO main_page_images (img) VALUES ('f9599e1b-2265-4f6c-8352-3628f1dd9cda.jpg');
INSERT INTO main_page_images (img) VALUES ('a18b25a5-0024-4e0b-9381-37567be09732.jpg');

INSERT INTO about (body) VALUES ('абзац для главной страницы');
INSERT INTO about (body) VALUES ('дополнительная информация');

INSERT INTO price (price_name, price_path) VALUES ('Основной прайс PDF', 'proverka.pdf');
INSERT INTO price (price_name, price_path) VALUES ('Дополнительная серия продукции Essentials PDF', 'Price_essentials.pdf');
INSERT INTO price (price_name, price_path) VALUES ('Основной прайс XLS', 'Price_main.xlsx');
INSERT INTO price (price_name, price_path) VALUES ('Дополнительная серия продукции Essentials XLS', 'Price_essentials.xls');
