SweetMix
========

Сайт заказа и самосборки вкусного и полезного. Ну или просто online-кондитерская.

*Сайт разработан на основе Mayak Rails Site Template*

TooDOshechka
------------
- сделать кнопку на конструктор в списоке готовых рецептов
- дисаблить кнопку оформить заказ, если нет товаров
- починить верстку слайдера, чтобы не дергался, когда убираешь слайды (третий в часности)
- fix fonts problem at Firefox
- переработать конструктор под one-page frontend application
- функция редактирования товаров из корзины и готовых товаров
- сделать механизм просмотра прошлых заказов
- разработать систему указания зон цены доставки
- разработать систему определения стоимости доставки по адресу пользователя
- показывать статичные товары в раздел сертификаты и давать возможность добавлять их в корзину
- добавить возможность использования промо-кода
- фильтр товаров в списке готовых
- сделать отзывы ( app/views/staticuses/comments.html.erb )
- партнёры: рассмотреть необходимость их


Используемые программные продукты
---------------------------------

Разработка основана на фрэймворке Ruby on Rails v3.2.15

Все используемые ruby гемы и их версии можно посмотреть в файле Gemfile в корне проекта

Так же используются:

  - [normalize.css](http://necolas.github.io/normalize.css/) v2.1.3
  - [Redactor](http://imperavi.com/redactor/) v9.1.4
  - [Chosen](http://harvesthq.github.io/chosen/) v1.0.0
  - [Dymio's HTML CSS template](https://github.com/dymio/html-css-template) v0.9
  - [Popapilus jQuery plugin](https://github.com/dymio/popapilus) v 0.9


Проблемы верстки
----------------

- слайдер ведёт себя странно, если убирать слайды
- слайд с сертификатами имеет странный, нелогичный css класс *custom*, я конечно сделал в админке галочку, которая добавляет этот класс, но объяснять что она делает - сложно
- *h2 class="title"* которые используются везде, где попало - это пиздец. Для SEO это просто катастрофа. Тэгами заголовков должны быть выделены только смысловые элементы. А делать ими лэйблы в форме конструктора - одна из грубейших ошибок, что может совершить верстальщик. Если хочешь использовать тот же стиль, то делай как Boorstrap, например - `h2, .h2 { /* some styles */ }` и используй p или div с нужным классом
- страница конструктора сделана как одна страница с переключением экранов js'ом, но совсем не учтено то, что, в зависимости от выбранной упаковки и состав и характеристики и основ и ингредиентов будут меняться. Нужно было или сделать ajax запрос к статичному json файлу и написать парсинг его, либо так же подгрузить html файл или просто разбить на разные страницы. А сейчас остаётся только выкинуть механихм переключения вкладок конструктора и сделать всё самому


Модули
------

Основа: контентные страницы, главное меню.
Модуль социальных сетей (шарики в футере).
Слайдер на главной.
Партнеры
Вопрос ответ:
  Управление
  добавление
  ответы
Корзина
Оформление
  ограничение разешения оформление заказа если слишком мало денег
Зоны доставки:
  заведение зон доставки
  определение стоимости доставки по адресу
  карта с зонами
Сохранение данных о клиенте по email'у или телефону
Оплата онлайн
Система кодов и купонов (посмотреть как реализовано)
Авторизация (?)
  Аутентификация пользователя по email или телефону
  Сохранение истории заказов, повтор заказа


Описание работы модуля продуктов
--------------------------------

В модуле есть несколько моделей:

- Товар `Product` может быть как простым и имеющим просто наименование и цену ( подарочная карта, ложка и т.п. ) так и сборным, состоящим из моделей, описанных ниже.
- Категория `ProductCategory` : мюсли, выпечка и т.п.
- Упаковка `ProductPack` определяет возможную емкость для основы и ингредиентов этого товара, принадлежит определенной категории;
- Основа `ProductBasis` это или основная смесь гранол для мюсли или вид теста выпечки и т.п. имеет название, состав и пищевую ценность, а так же связь с одной или несколькими упаковками - для каждой связи указывается вес и стоимость;
- Ингредиент `ProductIngridient` так же как и основа имеет название, данные по пищевой ценности и связи с упаковками, но не имеет состава, так как объект ингредиента сам по себе является составляющей;
- так же есть Тип ингредиента `ProductIngridientType`, но он нужен только для визуального разделения ингредиентов на экране, так что не несет важной смословой нагрузки;

Простой товар содержит название, описание, изображение и фиксированную стоимость за единицу. Тот факт, что товар простой, указывает установленный в true параметр-флаг `plain`. Простые товары либо нигде не отображаются и могут быть добавлены только с помощью специальной ссылки, либо отображаются на странице "подарочные карты" - это еще не решено.

Сборный товар создается в конструкторе. Для каждой Категории есть отдельная страница конструктора. Чтобы конструктор работал нужна, как минимум, одна упаковка в категории и одна основа, у которой есть связь с этой упаковкой. Если упаковок несколько, то есть отдельная страница конструктора для выбора упаковок, а если одна, то эта страница пропускается. То же самое справедливо для основ. Последним шагом собираются ингредиенты. Упаковка, своей ёмкостью `capacity` определяет максимальный суммарный вес основы и ингредиентов (знаю, что ёмкость определяет объём, а не массу, но тут случилась путаница, так что прошу читать ёмкость как "максимальный допустимый вес всех составляющих товара"). Напомню, что вес указывается в связи основы и упаковки и в связи ингредиента и упаковки.
Полностью собранный сборный товар можно или добавить в корзину или, если вы авторизированный администратор сайта, сохранить как "готовый рецепт".

По сути, каждый созданный товар, буть то простой, сборный "готовый рецепт" или собранный посетителем сайта является объектом Товар. Созданные администратором простые и сборные "готовые" отличаются от созданных посетителем установленным в true параметром-флагом `pcba`. В разделе админки "Товары" отображаются только они. Простые товары обязательно имеют `pcba == true`. В админке можно создать только простые товары, сборные товары создаются только в конструкторе, просто для админа появляется кнопка "Сохранить как готовый рецепт".

Как уже упоминалось, не может быть сборного товара, без хотя бы одной упаковки категории и хотя бы одной основы для этой упаковки. Но иногда есть смысл запрещать посетителю работать с конструктором категории. Для этого в объекте Категории есть параметр-флаг `construct_off`, который позволяет пользоваться конструктором только админинстратору.

Любой товар можно добавить в Заказ `Order`. Заказ имеет конечную стоимость, порядковый номер, а так же сериализованную информацию по каждому товару: название, его состав, если товар сборный, вес, если сборный, цена единицы товара, количество единиц, сумма. Это нужно для того, чтобы всегда сохранялась верная информация о заказе, даже если компоненты данного товара будут изменены или удалены. Так же у заказа есть данные о покупателе, доставке и статус оплаты, если способ оплаты выбран "Оплата онлайн".

Корзина является промежуточным звеном перед заказом. Все данные по корзине хранятся в куках пользователя: id товара и его количество. Все остальные данные собраются при открытии страницы корзины. При оформлении заказа куки очищаются. Соответственно добавление товара в корзину это просто добавление id товара в куки.
