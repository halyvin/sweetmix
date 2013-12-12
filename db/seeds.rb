# -*- encoding : utf-8 -*-
# DEMO DATA

seed_files_dir = File.join(Rails.root, "db/seed_files/")

# sig = StaticImage.new
# sig.image = File.open File.join(seed_files_dir, "example_pic.jpg")
# sig.save

home_content_page = ContentPage.homepage
home_content_page.body = <<-EOS
<div class="info__text_wrap">
  <h2 class="title">Заголовочек</h2>
  Данный интернет проект нацелен на то, что <b>каждый клиент может создать</b> свой индивидуальный продукт, который не только удовлетворяет его желания, но при этом готовиться на натуральных составляющих. Или другой текст, описывающий исключительность ваших продуктов и сайта.
</div><div class="info__text_wrap">
  <h2 class="title">Заголовок</h2>
  Данный интернет проект нацелен на то, что каждый клиент может создать свой индивидуальный продукт, который не только удовлетворяет его желания, но при этом готовиться на натуральных составляющих. Или другой текст, описывающий исключительность ваших продуктов и сайта.
</div><div class="info__text_wrap">
  <h2 class="title">Текст</h2>
  Данный интернет проект нацелен на то, что каждый клиент может создать свой индивидуальный продукт, который не только удовлетворяет его желания, но при этом готовиться на натуральных составляющих. Или другой текст, описывающий исключительность ваших продуктов и сайта.
</div>
EOS
home_content_page.save

content_pages_top_lvl = ContentPage.create([
  { title: "О нас", slug: "about", behavior_type: 1, prior: 2 },
  { title: "Наша продукция", slug: "production", behavior_type: 1, prior: 3 },
  { title: "Полезная информация", slug: "info", behavior_type: 1, prior: 4 },
  { title: "Служба поддержки", slug: "support", behavior_type: 1, prior: 5 }
])

content_pages_lvl_2 = ContentPage.create([
  {
    title: "Контактная информация",
    slug: "contacts",
    parent: content_pages_top_lvl[0],
    prior: 1,
    body: <<-EOS
<p>У Вас есть <strong>вопросы</strong>? <strong>предложения</strong>? <strong>комментарии</strong>? Не нашли ответы на интригующие вопросы в разделе <a href="/support/questions">FAQ</a>? Мы с радостью Вам ответим, выслушаем Вас и примем необходимые меры!</p>
<p>Мы также будем рады, если Вы готовы с нами сотрудничать!</p>
<h2 class="title">Контактная информация</h2>
<p>Email: <a href="mailto:info@sweetmix.su">info@sweetmix.su</a></p>
<p>Телефон: <a href="tel: +73912716151">+7 (391) 271-61-51</a></p>
<p><a href="tel:+73912726252">+7 (391) 272-62-52</a></p>
<p>Мы работаем каждый день с 9 до 21 часов и с радостью выслушаем Ваши отзывы и пожелания!</p>
<p>ОРНИП 313246822400040</p>
EOS
  },
  {
    title: "Сертификаты",
    slug: "certificates",
    parent: content_pages_top_lvl[0],
    prior: 2,
    body: <<-EOS
<h2 class="title">Подарочные карты на 500, 1000 и 2000 рублей.</h2>
<p>Вам нравится то, что мы готовим и Вы хотели бы рассказать своим близким о нас? Мы предлагаем подарочные сертификаты. У Вас есть возможность добавить в Корзину и оформить доставку (не только себе, но и Вашему лучшему другу, оплатив заказ онлайн) подарочных сертификатов трех номиналов. На каждом сертификате есть уникальный код, его необходимо ввести в поле "промо-код" и система автоматически вычтет из суммы заказа номинал сертификата.</p>
EOS
  },
  {
    title: "Вакансии",
    slug: "vacancy",
    parent: content_pages_top_lvl[0],
    prior: 3,
    body: <<-EOS
<ul class="vacancy_list">
  <li class="vacancy">
    <h2 class="title">Компания SweetMix</h2>
    <p>К сожалению на данный момент у нас нет свободных вакансий, но мы Всегда рады принять Ваши резюме на почту <a href="mailto:hello@sweetmix.su">hello@sweetmix.su</a>.</p>
  </li>
</ul>
EOS
  },
  {
    title: "Партнеры",
    slug: "partners",
    parent: content_pages_top_lvl[0],
    prior: 4,
    body: <<-EOS
<ul class="partners_list">
  <li class="partner">
  <p>
    <a href="http://www.barry-callebaut.com/3892" target="_blank"></a>
  </p>
  <p>
    <a href="http://www.barry-callebaut.com/3892" target="_blank"><img src="/system/uploads/static_image/3/logo_barrycallebaut.gif" alt="Barry Callebaut "></a>
  </p>
  </li>
</ul>
EOS
  },
  {
    title: "Отзывы",
    slug: "comments",
    parent: content_pages_top_lvl[0],
    prior: 5
  },
  {
    title: "Мюсли",
    slug: "muesli",
    parent: content_pages_top_lvl[1],
    prior: 1
  },
  {
    title: "Выпечка",
    slug: "cakes",
    parent: content_pages_top_lvl[1],
    prior: 2
  },
  {
    title: "Мороженое",
    slug: "ice-cream",
    parent: content_pages_top_lvl[1],
    prior: 3
  },
  {
    title: "Йогурты",
    slug: "yogurts",
    parent: content_pages_top_lvl[1],
    prior: 4
  },
  {
    title: "Горячие предложения",
    slug: "hot",
    parent: content_pages_top_lvl[1],
    prior: 5,
    body: <<-EOS
<p>На этой странице мы выкладываем наши горячие предложения. Акции, скидки, бонусы к заказам, конкурсы с призами, недели ингредиентов - все,  для то чтобы Вы могли получить приятные удовольствия!</p>
<p>Хотите всегда быть в курсе, но нечасто заходите на эту страницу? Подписывайтесь на наши страницы в <a href="https://www.facebook.com/mix.sweetmix">Facebook</a>, <a href="http://vk.com/sweetmix_24">Вконтакте</a>, <a href="http://www.odnoklassniki.ru/group/52955017117950">Одноклассники</a> и в <a href="">Instagram</a>.</p>
EOS
  },
  {
    title: "Срок годности",
    slug: "expiration",
    parent: content_pages_top_lvl[2],
    prior: 1,
    body: <<-EOS
<p>В сухом и прохладном месте (12-25°С), в упаковке, которую Вы не вскрывали, мюсли остаются свежими порядка 3 месяцев. Однако, мюсли SweetMix не долго застаиваются на полке - они очень вкусные и полезные! Приобрести мюсли Вы можете <a href="/sweets/constructor">здесь</a>. Однако нужно не забывать, что есть мюсли с ограниченным сроком годности (не более 1 месяца), в таких мюслях обычно содержатся такие компоненты как: чернослив, курага, финики, груша, персик, абрикос.</p>
EOS
  },
  {
    title: "Информация о доставке",
    slug: "delivery",
    parent: content_pages_top_lvl[2],
    prior: 2,
    body: <<-EOS
<p><em><strong>МЮСЛИ SweetMix</strong> – здоровый и высокопитательный продукт, изготавливается по оригинальным рецептам, которые трудно повторить!</em></p>
<p>После оформления заказа наш менеджер свяжется с Вами, чтобыподтвердить точный адрес, время и дату доставки выбранной Вами гранолы SweetMix.</p>
<p>Ваша гранола будет изготовлена с учётом выбранных Вами ингредиентов, а также индивидуальных пожеланий и доставлена на следующий день (при заказе до 12:00) после подтверждения менеджером Вашего заказа.При этом, мы не просто привозим перемешанные между собой ингредиенты, а выдерживаем целую технологию готовки. Для того чтоб продукт получился золотистым и вкусным после обжарки ему необходимо остыть при комнатной температуре в течение 5-6 часов.</p>
<p>Доставка по Красноярску составляет всего 150 рублей и <strong>бесплатна при заказе от 1500 рублей</strong>!</p>
<p>Доставка в Сосновоборс, Железногорск, Дивногорск составляет 500 рублей и <strong>бесплатная доставка при заказе от 2300 рублей</strong>!</p>
<ul class="delivery_rules_list">
</ul>
EOS
  },
  {
    title: "Вопросы и ответы",
    slug: "questions",
    parent: content_pages_top_lvl[3],
    prior: 1,
    body: <<-EOS
<ul class="questions_list">
<li class="question_wrap">
  <p class="question"><strong>Как долго хранятся мюсли SweetMix</strong>?</p>
  <p class="answer">В сухом и прохладном месте (12-25°С), в упаковке, которую Вы не вскрывали, мюсли остаются свежими порядка 3 месяцев. Однако, мюсли SweetMix не долго застаиваются на полке - они очень вкусные и полезные! Приобрести мюсли Вы можете <a href="/sweets/constructor">здесь</a>. Однако нужно не забывать, что есть мюсли с ограниченным сроком годности (не более 1 месяца), в таких мюслях обычно содержатся такие компоненты как: <strong>чернослив, курага, финики, груша, персик, абрикос</strong>.</p>
</li>
<li class="question_wrap">
  <p class="question"><strong>На сколько порций хватает одной упаковки</strong>?</p>
  <p class="answer">При среднем заказе в 500 грамм (основа + 5 дополнительных ингредиентов) упаковки хватает на 9 - 10 питательных порций.<del><strong>То есть стоимость полноценного сбалансированного завтрака в среднем составляет 35 рублей!</strong></del></p>
</li>
<li class="question_wrap">
  <p class="question"><strong>Какое количество ингредиентов может использовать клиент</strong>?</p>
  <p class="answer">На нашем сайте представлены два вида упаковки: большая и маленькая. Клиент может добрать к основе для мюсли от 1 до 8 ингредиентов. При этом порции могут удваиваться или утраиваться, но суммарный вес добавок не должен превышать 120 грамм и 320 грамм. Средний размер порции для большой упаковки 35 грамм, для маленькой 10 грамм.</p>
</li>
<li class="question_wrap">
  <p class="question"><strong>Добавляете ли Вы в мюсли SweetMix сахар, что бы они были вкуснее?</strong></p>
  <p class="answer">Мы не используем в наших мюслях сахара, консерванты и подсластители. Многие наши ингредиенты «от природы» сладкие, например курага! Что касается цукатов, мы постарались отобрать именно те, в которых применялась фруктоза.</p>
</li>
<li class="question_wrap">
  <p class="question"><strong>Все ли ингредиенты натуральные?</strong></p>
  <p class="answer">Наши ингредиенты для кранчей 100% натуральные! Мы используем от 3 до 7 злаков в каждой порции. Все наши ингредиенты: орехи, фрукты, цукаты, ягоды собраны со всех точек нашей планеты. Мы используем настоящий бельгийский шоколад (Barry Callebaut) признанный одним из лучших шоколадов в мире!</p>
</li>
<li class="question_wrap">
  <p class="question"><strong>Как долго мне ждать свой заказ и сколько стоит доставка?</strong></p>
  <p class="answer">Так как каждый заказ индивидуален, мы сможем доставить Ваш заказ только на следующий день! Более подробнее о доставке - в разделе <a href="/info/delivery">Информация о доставке</a>!</p>
</li>
<li class="question_wrap">
  <p class="question"><strong>Существует ли минимальны заказ?</strong></p>
  <p class="answer">Мы не ограничиваем Вас в количестве и сумме товара, но с <strong>экономической точки зрения</strong> для потребителя дешевле заказывать несколько товаров сразу, т.к. от количества товаров сумма доставки не изменяется. Более подробнее о доставке - в разделе <a href="/info/delivery">Информация о доставке</a>!</p>
</li>
<li class="question_wrap">
  <p class="question"><strong>Я указал(а) неправильный адрес?</strong></p>
  <p class="answer">Ничего страшного. Если Вы ввели неправильный адрес или хотите изменить адрес доставки Вашего товара, просто напишите нам на <a href="mailto:hello@sweetmix.su">hello@sweetmix.su</a> необходимую информацию вместе с номером Вашего заказа. Либо же позвоните нам по номеру <a href="tel: +73912716151">+7 (391) 271-61-51</a> или <a href="tel: +73912726252">+7 (391) 272-62-52</a></p>
</li>
<li class="question_wrap">
  <p class="question"><strong>Как я могу оплатить свой заказ?</strong></p>
  <p class="answer">Если вы живете в Красноярске, Вы можете оплатить заказ курьеру наличными, либо оплатить онлайн. Мы сотрудничаем с компанией <strong>Robokassa</strong> и поэтому у Вас есть возможность оплатить заказ удобным для Вас способом: <strong>оплата банковской картой, webmoney, QIWI, со счета мобильного телефона</strong> и еще <strong>более 15 способов оплаты</strong>).</p>
</li>
<li class="question_wrap">
  <p class="question"><strong>Почему у Вас нет моего любимого ингредиента?</strong></p>
  <p class="answer">Потому что Вы нам об этом никогда не говорили! Нам регулярно приходят письмо с просьбой включить ту или иную добавку в наш список и мы делаем это! Вы можете сообщить нам о любых своих пожеланиях, отправив сообщение на адрес <a href="mailto:hello@sweetmix.su">hello@sweetmix.su</a> или позвонив по телефону <a href="tel: +73912716151">+7 (391) 271-61-51</a> или <a href="tel: +73912726252">+7 (391) 272-62-52</a></p>
</li>
<li class="question_wrap">
  <p class="question"><strong>Помогите! Я не знаю какие ингредиенты лучше сочетаются между собой?</strong></p>
  <p class="answer">Не переживайте! Мы предлагаем Вам экспериментировать, но в любом случае на сайте представлен большой выбор готовых кранчей. Наш автор (профессиональный шеф-повар <a href="http://chefbannikoff.ru/index/obo-mne.html" target="_blank">Андрей Банников</a>) создал множество очень вкусных вариантов Мюслей, которые Вы точно полюбите.</p>
</li>
<li class="question_wrap">
  <p class="question"><strong>Не проще ли взять и самому приготовить дома такие же мюсли, ведь все ингредиенты продаются в магазинах?</strong></p>
  <p class="answer">Мы не запрещаем Вам пробовать готовить самостоятельно!<br>Для того чтоб самостоятельно приготовить, Вам для начала прийдется купить хотя бы 20 ингредиентов. В наших рецептах используется до 20 ингредиентов, включая специи и травы. Всего же у нас более 100 ингредиентов! Многие из них в обычном магазине не найти.<br>В приготовлении очень вкусной еды, всегда требуется творческий подход. У нашего шеф-повара <a href="http://chefbannikoff.ru/index/obo-mne.html">Андрея Банникова</a> нестандартное отношение с продуктами. Его творчество вызывает безумные эмоции и приятные удовольствия при трапезе. Нет, конечно, Вы можете поэтапно запекать при разных температурах хлопья, при этом добавляя специальные специи и готовить различные соусы, для того чтоб продукт не пережарить и многое другое. Мы не сомневаемся, что кто-то да сможет сделать, приближенный продукт к нашему, НО ведь это столько займет у Вас времени!<br>Приятнее получать готовый продукт и наслаждаться здоровой и вкусной пищей!<br>Если Вы не готовы делать Мюсли самостоятельно, мы Вам в этом поможем. У Вас есть большой выбор вкусных ингредиентов и уже готовых.<br>Приятного аппетита!</p>
</li>
<li class="question_wrap">
  <p class="question"><strong>Чем лучше заправлять мюсли SweetMix</strong>?</p>
  <p class="answer">В зависимости от Вашего предпочтения, Вы можете заправлять их молоком, йогуртом, кефиром, соком, водой и даже пивом! Если в Ваших Мюслях содержаться кусочки фруктов лучше всего использовать молоко или йогурт. Если Вы выбрали нетрадиционные Мюсли, такие как мужской завтрак - попробуйте заправить кефиром или пивом! Мы Вас не ограничиваем в вкусовых предпочтениях - творите свой любимый продукт!</p>
</li>
<li class="question_wrap">
  <p class="question"><strong>Мюсли SweetMix сладкие и хрустящие, как они могут быть здоровым питанием</strong>?</p>
  <p class="answer">Наши Мюсли сладкие за счет запекания с натуральным медом. Мы используем щадящий режим запекания, он позволяет впитать в себя все специи и приобрести красивый золотистый вид!<br>Мед - это натуральный продукт. Мед усваивается в нашем организме постепенно, в течение 20-30 минут. Мед является мощным антиоксидантом за счет содержания фенолов и флавоноидов, а также он разрушает вредные жиры типа холестерина.</p>
</li>
<li class="question_wrap">
  <p class="question"><strong>Могу ли я заказать точно такие же Мюсли, как собирал(а) в прошлый раз</strong>?</p>
  <p class="answer">Вам понравились наши Мюсли? Конечно можете, наша команда программистов разработала функцию, которая позволяет воспроизвести предыдущий заказ без каких либо дополнительных регистраций!<br> Нам необходимо зайти в <a href="/basket">Корзину</a> и в специальном окне ввести свой e-mail и у Вас автоматически высветится Ваш предыдущий заказ!</p>
</li>
</ul>
EOS
  },
  {
    title: "Советы диетолога",
    slug: "diet-advices",
    parent: content_pages_top_lvl[3],
    prior: 2
  }
])

main_nav_items_roots = MainNavItem.create([
  { title: "Мюсли", prior: 1, url_text: "/sweets/muesli" },
  { title: "Выпечка", prior: 4, url_text: "/sweets" },
  { title: "Мороженное", prior: 8, url_text: "/sweets/ice-cream" },
  { title: "Йогурт", prior: 9, url_text: "/sweets/yogurt" }
])
main_nav_items_seconds = MainNavItem.create([
  { title: "Создать мюсли", parent: main_nav_items_roots[0], prior: 2, url_text: "/sweets/muesli/constructor" },
  { title: "Готовые рецепты", parent: main_nav_items_roots[0], prior: 3, url_text: "/sweets/muesli" },
  { title: "Кексы", parent: main_nav_items_roots[1], prior: 5, url_text: "/sweets/keks" },
  { title: "Песочные человечки", parent: main_nav_items_roots[1], prior: 6, url_text: "/sweets/sandman" },
  { title: "Макаруны", parent: main_nav_items_roots[1], prior: 7, url_text: "/sweets/makarun" }
])

SocialLink.create([
  { social_type: 0, prior: 1, url: "http://instagram.com/" },
  { social_type: 1, prior: 2, url: "http://www.youtube.com/" },
  { social_type: 2, prior: 3, url: "http://vk.com/sweetmix_24" },
  { social_type: 3, prior: 4, url: "http://www.odnoklassniki.ru/group/52955017117950" },
  { social_type: 4, prior: 5, url: "https://www.facebook.com/mix.sweetmix" }
])

slides = Slide.create([
  { title: "Мюсли",
    subtitle: "Заголовок второго уровня для мюслей",
    backg: 1,
    btn_link: "/sweets/muesli",
    btn_text: "Заказать мюсли",
    image_at_right: true,
    prior: 1,
    descr: "Данный интернет проект нацелен на то, что каждый клиент может создать свой индивидуальный продукт, который не только удовлетворяет его желания, но при этом готовиться на натуральных составляющих. Или другой текст, описывающий исключительность ваших продуктов и сайта." },
  { title: "Выпечка",
    subtitle: "Подзаголовок выпечки",
    backg: 2,
    btn_link: "/sweets/keks",
    btn_text: "Заказать выпечку",
    prior: 2,
    descr: "Данный интернет проект нацелен на то, что каждый клиент может создать свой индивидуальный продукт, который не только удовлетворяет его желания, но при этом готовиться на натуральных составляющих. Или другой текст, описывающий исключительность ваших продуктов и сайта." },
  { title: "Подарочные сертификаты",
    backg: 2,
    btn_link: "/about/certificates",
    btn_text: "Заказать",
    image_at_right: true,
    prior: 3,
    custom: true,
    descr: "Данный интернет проект нацелен на то, что каждый клиент может создать свой индивидуальный продукт, который не только удовлетворяет его желания" }
])
slides[0].image = File.open File.join(seed_files_dir, "slide_img.jpg")
slides[0].save
slides[1].image = File.open File.join(seed_files_dir, "slide_img.jpg")
slides[1].save
slides[2].image = File.open File.join(seed_files_dir, "slide_serts.png")
slides[2].save

InfoProductCircle.create([
  { title: "Мюсли", url: "/sweets/constructor", prodcode: 0, prior: 1 },
  { title: "Выпечка", url: "/sweets/constructor", prodcode: 1, prior: 1 },
  { title: "Мороженное", url: "/sweets/constructor", prodcode: 2, prior: 1 },
  { title: "Йогурт", url: "/sweets/constructor", prodcode: 3, prior: 1 }
])

# ============================================================================
# ========================== SETTINGS ========================================
# ============================================================================

SiteSetting.set_value_for 'page_of_contacts', content_pages_lvl_2[0]
SiteSetting.set_value_for 'page_of_sertificates', content_pages_lvl_2[1]
SiteSetting.set_value_for 'page_of_comments', content_pages_lvl_2[4]

# ============================================================================
# =========================== SWEETS =========================================
# ============================================================================

categories = ProductCategory.create([
  {
    name_one: "Мюсли",
    name_few: "Мюсли",
    name_many: "Мюсли",
    name_other: "Мюсли",
    slug: "muesli"
  },
  {
    name_one: "Кекс",
    name_few: "Кекса",
    name_many: "Кексов",
    name_other: "Кексы",
    slug: "keks"
  },
  {
    name_one: "Подарочная карта",
    name_few: "Подарочных карты",
    name_many: "Подарочных карт",
    name_other: "Подарочные карты",
    slug: "presents"
  }
])

packs = ProductPack.create([
  {
    name: "Большая упаковка на 1 неделю.",
    category: categories[0],
    capacity: 900
  },
  {
    name: "Маленькая упаковка на 1 день.",
    category: categories[0],
    capacity: 180
  },
  {
    name: "Большая упаковка (12 штук)",
    category: categories[1],
    capacity: 1200
  }
])
packs[0].image = File.open File.join(seed_files_dir, "pack_muesli_01.png")
packs[0].save
packs[1].image = File.open File.join(seed_files_dir, "pack_muesli_02.png")
packs[1].save

bases = ProductBasis.create([
  {
    name: "Шоколадно-ореховая гранола",
    descr: "Тукан прочно притягивает вращательный апогей (расчет Тарутия затмения точен - 23 хояка 1 г. II О. = 24.06.-771). Весеннее равноденствие перечеркивает астероидный афелий , но кольца видны только при 40–50. Декретное время, оценивая блеск освещенного металического шарика, ничтожно гасит центральный реликтовый ледник, но кольца видны только при 40–50. Керн, в первом приближении, прочно гасит близкий тропический год, учитывая, что в одном парсеке 3,26 световых года. Космогоническая гипотеза Шмидта позволяет достаточно просто объяснить эту нестыковку, однако гелиоцентрическое расстояние жизненно колеблет вращательный лимб, однако большинство спутников движутся вокруг своих планет в ту же сторону, в какую вращаются планеты. Полнолуние пространственно неоднородно.",
    composition: "шоколадка\nорешка\nгранулка\nлюбовь\nрадость"
  },
  {
    name: "Молочно-чайная гранола",
    descr: "Процесс отражает капилляр в полном соответствии с законом Дарси. Солифлюкция дает подбур, однозначно свидетельствуя о неустойчивости процесса в целом. Плотность твёрдой фазы растворяет упруго-пластичный бугор пучения, хотя этот факт нуждается в дальнейшей тщательной экспериментальной проверке. При прочих равных условиях дистанционное зондирование охлаждает мозаичный минерал только в отсутствие тепло- и массообмена.",
    composition: "молочко\nчаёк\nгранулка\nлюбовь\nсчастье"
  },
  {
    name: "Фруктово-ягодная гранола",
    descr: "Бихевиоризм притягивает кризис, таким образом, стратегия поведения, выгодная отдельному человеку, ведет к коллективному проигрышу. Поведенческая терапия последовательно отчуждает социометрический комплекс, хотя этот факт нуждается в дальнейшей проверке наблюдением. Воспитание аннигилирует концептуальный филогенез, также это подчеркивается в труде",
    composition: "фруктики\nягодки\nгранулки\nлюбовь\nпокой"
  },
  {
    name: "Шоколадный кекс",
    descr: "Шаг смешения отражает упруго-пластичный агрегат одинаково по всем направлениям. Процесс вымывает в тяжелосуглинистый фингер-эффект, все дальнейшее далеко выходит за рамки текущего исследования и не будет здесь рассматриваться. Обеднение приводит к появлению смешанный подбел, и этот процесс может повторяться многократно. Как следует из закона сохранения массы и энергии, отложение ускоряет электрод одинаково по всем направлениям. Лессиваж, по данным почвенной съемки, корреляционно усиливает межагрегатный фингер-эффект, вне зависимости от предсказаний теоретической модели явления. Конечно, нельзя не принять во внимание тот факт, что отложение волнообразно."
  },
  {
    name: "Ванильный кекс",
    descr: "Противостояние притягивает метеорный дождь, однако большинство спутников движутся вокруг своих планет в ту же сторону, в какую вращаются планеты. Эклиптика параллельна. Скоpость кометы в пеpигелии многопланово отражает космический тропический год, об интересе Галла к астрономии и затмениям Цицерон говорит также в трактате "О старости" (De senectute). Многие кометы имеют два хвоста, однако весеннее равноденствие иллюстрирует pадиотелескоп Максвелла, это довольно часто наблюдается у сверхновых звезд второго типа. Весеннее равноденствие, сублимиpуя с повеpхности ядpа кометы, гасит дип-скай объект, но кольца видны только при 40–50.",
    composition: "ванилька\nтесто"
  }
])
bases[0].image = File.open File.join(seed_files_dir, "basis_muesli.png")
bases[0].save
bases[1].image = File.open File.join(seed_files_dir, "basis_muesli.png")
bases[1].save
bases[2].image = File.open File.join(seed_files_dir, "basis_muesli.png")
bases[2].save
bases[3].image = File.open File.join(seed_files_dir, "basis_keks.png")
bases[3].save
bases[4].image = File.open File.join(seed_files_dir, "basis_keks.png")
bases[4].save
bases[0].bases_packs_relations << BasesPacksRelation.create(product_pack: packs[0], price: 240, weight: 360)
bases[0].bases_packs_relations << BasesPacksRelation.create(product_pack: packs[1], price: 80, weight: 80)
bases[1].bases_packs_relations << BasesPacksRelation.create(product_pack: packs[0], price: 260, weight: 360)
bases[1].bases_packs_relations << BasesPacksRelation.create(product_pack: packs[1], price: 86, weight: 80)
bases[2].bases_packs_relations << BasesPacksRelation.create(product_pack: packs[0], price: 72, weight: 360)
bases[2].bases_packs_relations << BasesPacksRelation.create(product_pack: packs[1], price: 240, weight: 80)
bases[3].bases_packs_relations << BasesPacksRelation.create(product_pack: packs[2], price: 440, weight: 960)
bases[4].bases_packs_relations << BasesPacksRelation.create(product_pack: packs[2], price: 400, weight: 960)

ingridient_types = ProductIngridientType.create([
  { name: "Ягоды" }, { name: "Орехи" }, { name: "Фрукты" },
  { name: "Злаки" }, { name: "Сладости" }, { name: "Йогурт" },
]);

ingridients = ProductIngridient.create([
  { name: "Клубника", type: ingridient_types[0] },
  { name: "Черника", type: ingridient_types[0] },
  { name: "Малина", type: ingridient_types[0] },
  { name: "Фундук", type: ingridient_types[1] },
  { name: "Арахис", type: ingridient_types[1] },
  { name: "Банан", type: ingridient_types[2] },
  { name: "Апельсин", type: ingridient_types[2] },
  { name: "Персик", type: ingridient_types[2] }
])
ingridients[0].image = File.open File.join(seed_files_dir, "ingrid_001.jpg")
ingridients[0].save
ingridients[1].image = File.open File.join(seed_files_dir, "ingrid_002.jpg")
ingridients[1].save
ingridients[2].image = File.open File.join(seed_files_dir, "ingrid_003.jpg")
ingridients[2].save
ingridients[3].image = File.open File.join(seed_files_dir, "ingrid_004.jpg")
ingridients[3].save
ingridients[4].image = File.open File.join(seed_files_dir, "ingrid_005.jpg")
ingridients[4].save
ingridients[5].image = File.open File.join(seed_files_dir, "ingrid_006.jpg")
ingridients[5].save
ingridients[6].image = File.open File.join(seed_files_dir, "ingrid_007.jpg")
ingridients[6].save
ingridients[7].image = File.open File.join(seed_files_dir, "ingrid_008.jpg")
ingridients[7].save

ingridients[0].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[0], price: 70, weight: 40 })
ingridients[1].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[0], price: 50, weight: 40 })
ingridients[2].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[0], price: 70, weight: 40 })
ingridients[3].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[0], price: 50, weight: 40 })
ingridients[4].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[0], price: 80, weight: 40 })
ingridients[5].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[0], price: 50, weight: 40 })
ingridients[6].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[0], price: 70, weight: 40 })
ingridients[7].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[0], price: 100, weight: 40 })

ingridients[0].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[1], price: 40, weight: 10 })
ingridients[1].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[1], price: 30, weight: 10 })
ingridients[2].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[1], price: 40, weight: 10 })
ingridients[3].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[1], price: 30, weight: 10 })
ingridients[4].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[1], price: 40, weight: 10 })
ingridients[5].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[1], price: 30, weight: 10 })
ingridients[6].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[1], price: 40, weight: 10 })
ingridients[7].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[1], price: 50, weight: 10 })

ingridients[0].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[2], price: 80, weight: 60 })
ingridients[1].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[2], price: 60, weight: 60 })
ingridients[2].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[2], price: 80, weight: 60 })
ingridients[3].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[2], price: 60, weight: 60 })
ingridients[4].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[2], price: 90, weight: 60 })
ingridients[5].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[2], price: 60, weight: 60 })
ingridients[6].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[2], price: 80, weight: 60 })
ingridients[7].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: packs[2], price: 110, weight: 60 })

products = Product.create([
  {
    name: "Шоколадно-ореховый кекс",
    article: "KKS001",
    category: categories[1],
    pcba: true,
    pack: packs[2],
    basis: bases[4],
    price: 1000,
    ingridients: [ ingridients[3], ingridients[4] ]
  },
  {
    name: "Фруктово-ореховый кекс",
    article: "KKS002",
    category: categories[1],
    pcba: true,
    pack: packs[2],
    basis: bases[4],
    price: 800,
    ingridients: [ ingridients[5], ingridients[7] ]
  },
  {
    name: "Подарочная карта 500",
    article: "PSK001",
    category: categories[2],
    pcba: true,
    plain: true,
    price: 500
  }
])
