# -*- encoding : utf-8 -*-
# DEMO DATA

seed_files_dir = File.join(Rails.root, "db/seed_files/")

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
  { name: "Шоколадно-ореховая гранола" },
  { name: "Молочно-чайная гранола" },
  { name: "Фруктово-ягодная гранола" },
  { name: "Шоколадный кекс" },
  { name: "Ванильный кекс" }
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

# sig = StaticImage.new
# sig.image = File.open File.join(seed_files_dir, "example_pic.jpg")
# sig.save

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
    prior: 1
  },
  {
    title: "Сертификаты",
    slug: "certificates",
    parent: content_pages_top_lvl[0],
    prior: 2
  },
  {
    title: "Вакансии",
    slug: "vacancy",
    parent: content_pages_top_lvl[0],
    prior: 3
  },
  {
    title: "Партнеры",
    slug: "partners",
    parent: content_pages_top_lvl[0],
    prior: 4
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
    prior: 5
  },
  {
    title: "Срок годности",
    slug: "expiration",
    parent: content_pages_top_lvl[2],
    prior: 1
  },
  {
    title: "Информация о доставке",
    slug: "delivery",
    parent: content_pages_top_lvl[2],
    prior: 2
  },
  {
    title: "Вопросы и ответы",
    slug: "questions",
    parent: content_pages_top_lvl[3],
    prior: 1
  },
  {
    title: "Советы диетолога",
    slug: "diet-advices",
    parent: content_pages_top_lvl[3],
    prior: 2
  }
])

SocialLink.create([
  { social_type: 0, prior: 1, url: "http://instagram.com/" },
  { social_type: 1, prior: 2, url: "http://www.youtube.com/" },
  { social_type: 2, prior: 3, url: "https://vk.com" },
  { social_type: 3, prior: 4, url: "http://www.odnoklassniki.ru/" },
  { social_type: 4, prior: 5, url: "https://www.facebook.com/" }
])

