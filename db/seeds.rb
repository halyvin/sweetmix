# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category = ProductCategory.create({
  name_one: "Кекс",
  name_few: "Кекса",
  name_many: "Кексов",
  name_other: "Кексы",
  slug: "keks"
})
pkcateg = ProductCategory.create({
  name_one: "Подарочная карта",
  name_few: "Подарочных карты",
  name_many: "Подарочных карт",
  name_other: "Подарочные карты",
  slug: "presents"
})
pack = ProductPack.create name: "Большая упаковка (12 штук)",
                          category: category,
                          capacity: 1200
basis = ProductBasis.create name: "Шоколадный кекс",
                            descr: "Это вкусно!",
                            composition: "тесто\nшоколад"

basis.bases_packs_relations << BasesPacksRelation.create(product_pack: pack,
                                                         price: 240,
                                                         weight: 960)

ingridient_types = ProductIngridientType.create([
  { name: "Ягоды" }, { name: "Орехи" }, { name: "Фрукты" },
  { name: "Злаки" }, { name: "Сладости" }, { name: "Йогурт" },
]);

ingridients = ProductIngridient.create([
  { name: "Клубника", type: ingridient_types[0] },
  { name: "Голубика", type: ingridient_types[0] },
  { name: "Малина", type: ingridient_types[0] },
  { name: "Фундук", type: ingridient_types[1] },
  { name: "Арахис", type: ingridient_types[1] },
  { name: "Банан", type: ingridient_types[2] },
  { name: "Апельсин", type: ingridient_types[2] },
  { name: "Персик", type: ingridient_types[2] }
])

ingridients[0].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: pack, price: 40, weight: 80 })
ingridients[1].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: pack, price: 30, weight: 80 })
ingridients[2].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: pack, price: 40, weight: 80 })
ingridients[3].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: pack, price: 30, weight: 80 })
ingridients[4].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: pack, price: 40, weight: 80 })
ingridients[5].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: pack, price: 30, weight: 80 })
ingridients[6].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: pack, price: 40, weight: 80 })
ingridients[7].ingridients_packs_relations << IngridientsPacksRelation.create({
  product_pack: pack, price: 50, weight: 80 })

products = Product.create([
  {
    name: "Шоколадно-ореховый кекс",
    article: "KKS001",
    category: category,
    pcba: true,
    pack: pack,
    basis: basis,
    price: 1000,
    ingridients: [ ingridients[3], ingridients[4] ]
  },
  {
    name: "Фруктово-ореховый кекс",
    article: "KKS002",
    category: category,
    pcba: true,
    pack: pack,
    basis: basis,
    price: 800,
    ingridients: [ ingridients[5], ingridients[7] ]
  },
  {
    name: "Подарочная карта 500",
    article: "PSK001",
    category: pkcateg,
    pcba: true,
    plain: true,
    price: 500
  }
])


# seed_files_dir = File.join(Rails.root, "db/seed_files/")
# sig = StaticImage.new
# sig.image = File.open File.join(seed_files_dir, "example_pic.jpg")
# sig.save

# homepage = ContentPage.homepage
# homepage.body = <<-EOS
# <h2>Welcome to Mayak Rails SiteTemplate demo site about russian animation!</h2>
# <p>I glad to see you here. Please have a look.</p>
# EOS
# homepage.save

# content_pages_top_lvl = ContentPage.create([
#   {
#     title: "Contacts",
#     slug: "contacts",
#     immortal: true,
#     prior: 11,
#     body: <<-EOS
# <h1>My contacts</h1>
# <p>Source code: <a href="http://github.com/dymio/mayak">github repo</a></p>
# <p>Author website: <a href="http://dymio.net">dymio.net</a></p>
# <p>Author email: <a href="mailto:mstrdymio@gmail.com">mstrdymio@gmail.com</a></p>
# <p>My name is Ivan Dymkov. :)</p>
# <p>And yes, I know nothing about russian animation, apart from the fact that I have seen almost all russian animation movies.</p>
# EOS
#   },
#   {
#     title: "History",
#     slug: "history",
#     prior: 2,
#     behavior_type: 1,
#     body: <<-EOS
# <h1>History</h1>
# <p>The History of Russian animation is the film art produced by Russian animation makers. As most of Russia's production of animation for film|cinema and television were created during <a href="http://en.wikipedia.org/wiki/Soviet_Union">Soviet</a> times, it may also be referred to some extent as the <strong>History of Soviet animation</strong>. It remains a nearly unexplored field in <a href="http://en.wikipedia.org/wiki/Film_theory">film theory</a> and history outside Russia.</p>
# <p>Information taken from <a href="http://en.wikipedia.org/wiki/History_of_Russian_animation">Wikipedia article "History of Russian animation"</a> version from October 18, 2013.</p>
# <p>You can know about every period of russian animation from pages at the side navigation.</p>
# EOS
#   },
#   {
#     title: "Resources",
#     slug: "resources",
#     prior: 3,
#     body: <<-EOS
# <h1>Internet resources about Russian animation</h1>
# <p><a href="http://www.pinterest.com/hashinotamoto/russian-animation/" target="_blank">Printerest of one japanise man</a> about Russian animation and most of part about Cheburashka.</p>
# <p>Nice <a href="http://www.hoodedutilitarian.com/2013/08/russian-animation/" target="_blank">article from Patrick Carland</a>.</p>
# <p><a href="http://editthis.info/animatsiya/List_of_Russian_animation_subtitled_in_English" target="_blank">List of Russian animation</a> subtitled in English from editthis.info.</p>
# <p><a href="http://animationstories.wordpress.com/">Illusion of movement</a> - blog about Russian animation and history of it.</p>
# <p><a href="https://www.facebook.com/russiananimationpage" target="_blank">Facebook page</a> about Russian animation.</p>
# <p><a href="http://en.wikipedia.org/wiki/Masters_of_Russian_Animation" target="_blank">Wikipedia article</a> about Russian four-DVD animation collection that contains 45 short animations and stop-motion animations.</p>
# <p><a href="http://www.tumblr.com/tagged/russian-animation" target="_blank">Materials</a> about Rissian animation in Tumblr.</p>
# <p><a href="http://www.youtube.com/user/Soyuzmult" target="_blank">Youtube channel</a> with a lot of Russian animation (no subtitles).</p>
# EOS
#   },
# #   {
# #     title: "News",
# #     slug: "news",
# #     prior: 4,
# #     body: <<-EOS
# # <h1>News</h1>
# # EOS
# #   }
# ])

# content_pages_lvl_two = ContentPage.create([
#   {
#     title: "Beginnings",
#     slug: "beginnings",
#     parent: content_pages_top_lvl[1],
#     prior: 1,
#     body: <<-EOS
# <h1>Beginnings</h1>
# <p>The first animator in Russia was <a href="http://en.wikipedia.org/w/index.php?title=Aleksander_Shiryayev&action=edit&redlink=1">Aleksander Shiryayev</a>, who was a principal dancer at the <a href="http://en.wikipedia.org/wiki/Imperial_Russian_Ballet">Imperial Russian Ballet</a>, as well as a teacher and choreographer. He made a number of pioneering puppet-animated ballet films between 1906 and 1909. He only showed them to a few people, and they were forgotten until their re-discovery in 1995.</p>
# <p>The second person in Russia to independently discover animation was <a href="http://en.wikipedia.org/wiki/Ladislas_Starevich">Ladislas Starevich</a>, who was of Polish descent and is therefore also known by the name of Wladyslaw Starewicz. Being a trained biologist, he started to make animation with embalmed insects for educational purposes, but soon realized the possibilities of his medium to become one of the undisputed masters of <a href="http://en.wikipedia.org/wiki/Stop_motion">stop motion</a> later in his life. His first few films, made in 1910, were <a href="http://en.wikipedia.org/wiki/Black_comedy">dark comedies</a> on the family lives of cockroaches, and were so revolutionary that they earned Starevich a decoration from <a href="http://en.wikipedia.org/wiki/Nicholas_II_of_Russia">the Tsar</a>. Starevich's 41-minute 1913 film <em><a href="http://en.wikipedia.org/wiki/The_Night_Before_Christmas_(1913_film)">The Night Before Christmas</a></em> was the first example of the use of <a href="http://en.wikipedia.org/wiki/Stop_motion">stop motion</a> and live action in the same scene.</p>
# <p>After Starevich's emigration following the <a href="http://en.wikipedia.org/wiki/October_Revolution">October Revolution</a>, animation in Russia came to a standstill for years. Only by the mid-to-late-1920s could Soviet authorities be convinced to finance experimental studios. These were typically part of a bigger film studio and were in the beginning most often used to produce short animated clips for <a href="http://en.wikipedia.org/wiki/Propaganda">propaganda</a> purposes. Example of political animated clip is <em><a href="http://mults.spb.ru/mults/?id=2151">China in flames</a></em> (1925) by Zenon Komissarenko, Yuriy Merkulov and Nikolay Khodatayev.</p>
# <p>In doing so, these early pioneers could experiment with their equipment as well as with their <a href="http://en.wikipedia.org/wiki/Aesthetics">aesthetics</a>. Creators like <a href="http://en.wikipedia.org/wiki/Ivan_Ivanov-Vano">Ivan Ivanov-Vano</a>, <a href="http://en.wikipedia.org/w/index.php?title=Mikhail_Tsekhanovsky&action=edit&redlink=1">Mikhail Tsekhanovsky</a> or <a href="http://en.wikipedia.org/w/index.php?title=Nikolay_Khodatayev&action=edit&redlink=1">Nikolay Khodatayev</a> made their debut films in a very fresh and interesting way, aesthetically very different from American <a href="http://en.wikipedia.org/wiki/Animator">animators</a>. As Ivanov-Vano recalls in his mémoires, <em>Kadr za Kadrom</em> (<em>Frame by Frame</em>), this was partly because of the general atmosphere the <a href="http://en.wikipedia.org/wiki/Russian_avantgarde">Russian avantgarde</a>created around them and partly because they were able to experiment in small groups of enthusiasts. Important films of this era include Ivanov-Vano's <em>On the skating rink</em> (1927), Tsekhanovsky's <em>Post</em> (1929) and Khodataev's <em>The barrel organ</em> (1934).</p>
# <p>Another remarkable figure of the time is <a href="http://en.wikipedia.org/wiki/Aleksandr_Ptushko">Aleksandr Ptushko</a>. He was a trained architect, but earlier in his life had worked in <a href="http://en.wikipedia.org/wiki/Mechanical_engineering">mechanical engineering</a>. In this field, he is known for the invention of an adding machine that was in use in the <a href="http://en.wikipedia.org/wiki/Soviet_Union">Soviet Union</a> until the 1970s (an example of it can be seen in <a href="http://en.wikipedia.org/wiki/Fyodor_Khitruk">Fyodor Khitruk</a>'s first film as a director, <em><a href="http://en.wikipedia.org/wiki/The_Story_of_a_Crime">The Story of a Crime</a></em> of 1962). When he joined the <a href="http://en.wikipedia.org/wiki/Puppet_animation">puppet animation</a> unit of <a href="http://en.wikipedia.org/wiki/Mosfilm">Mosfilm</a>, he found an ideal environment to live out his mechanical ambitions as well as his artistic ones, and became internationally renowned with the Soviet Union's first <a href="http://en.wikipedia.org/wiki/Feature_film">feature-length</a> animated film,<em><a href="http://en.wikipedia.org/wiki/The_New_Gulliver">The New Gulliver</a></em> (1935). This film mixes puppet animation and live acting. It is an explicitly ideological retelling of <a href="http://en.wikipedia.org/wiki/Jonathan_Swift">Jonathan Swift</a>'s novel. It nevertheless is considered a masterpiece of animation, featuring mass scenes with hundreds of extras, very expressive mimics in close-ups, and innovative, flexible camera work combined with excellent scenography. Ptushko became the first director of the newly founded <a href="http://en.wikipedia.org/wiki/Soyuzdetmultfilm">Soyuzdetmultfilm</a>-Studio, but soon after left to devote himself to <a href="http://en.wikipedia.org/w/index.php?title=Live-action_cinema&action=edit&redlink=1">live-action cinema</a>. Still, even in his <a href="http://en.wikipedia.org/wiki/Feature_film">feature films</a> he showed a liking for <a href="http://en.wikipedia.org/wiki/Stop-motion">stop-motion</a> special effects, e.g. in <em><a href="http://en.wikipedia.org/wiki/Ilya_Muromets_(film)">Ilya Muromets</a></em> (1956).</p>
# <p>Information taken from <a href="http://en.wikipedia.org/wiki/History_of_Russian_animation">Wikipedia article "History of Russian animation"</a> version from October 18, 2013.</p>
# EOS
#   },
#   {
#     title: "From Khrushchev Thaw to Perestroika",
#     slug: "from-khrushchev-thaw-to-perestroika",
#     parent: content_pages_top_lvl[1],
#     prior: 3,
#     body: <<-EOS
# <h1>From Khrushchev Thaw to Perestroika</h1>
# <p>When <a href="http://en.wikipedia.org/wiki/Nikita_Khrushchev">Nikita Khrushchev</a> in 1956 proclaimed the end of the personality cult of <a href="http://en.wikipedia.org/wiki/Joseph_Stalin">Joseph Stalin</a>, he started a process of political and cultural renewal in the country. Even though animators still needed a while to free themselves from the long tradition of "Éclair", from the 1960s onwards, animation films gain completely new qualities. The starting point for this was <a href="http://en.wikipedia.org/wiki/Fyodor_Khitruk">Fyodor Khitruk</a>'s film <em><a href="http://en.wikipedia.org/wiki/The_Story_of_a_Crime">The Story of a Crime</a></em> (1962). Not only had he changed the animation style to something that resembled what the <a href="http://en.wikipedia.org/wiki/United_Productions_of_America">United Productions of America</a> was doing, but for the first time since the <a href="http://en.wikipedia.org/wiki/Avantgarde">avantgarde</a> years, he was able to tackle a contemporary story.</p>
# <p><a href="http://en.wikipedia.org/wiki/File:Vinni_pukh_by_fjodor_khitruk.jpg"><img alt="" src="http://upload.wikimedia.org/wikipedia/en/thumb/d/d6/Vinni_pukh_by_fjodor_khitruk.jpg/220px-Vinni_pukh_by_fjodor_khitruk.jpg" width="220" height="163" srcset="//upload.wikimedia.org/wikipedia/en/thumb/d/d6/Vinni_pukh_by_fjodor_khitruk.jpg/330px-Vinni_pukh_by_fjodor_khitruk.jpg 1.5x, //upload.wikimedia.org/wikipedia/en/d/d6/Vinni_pukh_by_fjodor_khitruk.jpg 2x"></a></p>
# <p><a href="http://en.wikipedia.org/wiki/Winnie-the-Pooh#Soviet_adaptation">Winnie-the-Pooh</a> (1969)</p>
# <p>Khitruk's revolutionary approach paved the way for a vast number of young animation directors that in the following years developed their own distinctive styles and approaches. One of the most political was <a href="http://en.wikipedia.org/wiki/Andrei_Khrzhanovsky">Andrei Khrzhanovsky</a>, whose <a href="http://en.wikipedia.org/wiki/Surrealism">surrealist</a> film <em><a href="http://en.wikipedia.org/wiki/The_Glass_Harmonica">The Glass Harmonica</a></em> (1968) was severely cut by censors, but shelved nevertheless. <a href="http://en.wikipedia.org/w/index.php?title=Anatoly_Petrov&action=edit&redlink=1">Anatoly Petrov</a> is known as the founder of the cinema journal <em>Vesyolaya Karusel</em> (<em>The Happy Merry-Go-Round</em>, since 1969) that gave an opportunity to many young directors to make their first own films. Among them were <a href="http://en.wikipedia.org/w/index.php?title=Leonid_Nosyrev&action=edit&redlink=1">Leonid Nosyrev</a>, <a href="http://en.wikipedia.org/w/index.php?title=Valery_Ugarov&action=edit&redlink=1">Valery Ugarov</a>, <a href="http://en.wikipedia.org/w/index.php?title=Eduard_Nazarov&action=edit&redlink=1">Eduard Nazarov</a>, <a href="http://en.wikipedia.org/w/index.php?title=Ivan_Ufimcev&action=edit&redlink=1">Ivan Ufimcev</a> and others.</p>
# <p><a href="http://en.wikipedia.org/wiki/File:Nu_pogodi_by_vjacheslav_kotenochkin.jpg"><img alt="" src="http://upload.wikimedia.org/wikipedia/en/thumb/c/c4/Nu_pogodi_by_vjacheslav_kotenochkin.jpg/220px-Nu_pogodi_by_vjacheslav_kotenochkin.jpg" width="220" height="168" srcset="//upload.wikimedia.org/wikipedia/en/c/c4/Nu_pogodi_by_vjacheslav_kotenochkin.jpg 1.5x, //upload.wikimedia.org/wikipedia/en/c/c4/Nu_pogodi_by_vjacheslav_kotenochkin.jpg 2x"></a></p>
# <p><em><a href="http://en.wikipedia.org/wiki/Nu,_pogodi!">Nu, pogodi!</a></em> (1969–2006)</p>
# <p>The 1970s saw the birth of the Soviet Union's most popular animation series, <em><a href="http://en.wikipedia.org/wiki/Nu,_Pogodi!">Nu, Pogodi!</a></em> (<em>Just you wait!</em>), directed by <a href="http://en.wikipedia.org/wiki/Vyacheslav_Kotyonochkin">Vyacheslav Kotyonochkin</a>. These seemingly simple miniatures about a wolf chasing a hare through Soviet-style <a href="http://en.wikipedia.org/wiki/Cartoon">cartoon</a> worlds owe a great deal of their popularity to the cunning <a href="http://en.wikipedia.org/wiki/Subtext">subtexts</a> built into their parts.</p>
# <p>During the Stalin period, <a href="http://en.wikipedia.org/wiki/Puppet">puppet</a> animation had come to a halt. Only in 1953 was a puppet division was refounded at <a href="http://en.wikipedia.org/wiki/Soyuzmultfilm">Soyuzmultfilm</a>. Its first head of department was <a href="http://en.wikipedia.org/w/index.php?title=Boris_Degtyarev&action=edit&redlink=1">Boris Degtyarev</a>, under whose direction young animators tried to recover the knowledge that had been lost since the time of <a href="http://en.wikipedia.org/wiki/Aleksandr_Ptushko">Aleksandr Ptushko</a>. Among the most outstanding of these young artists were <a href="http://en.wikipedia.org/w/index.php?title=Vadim_Kurchevskiy&action=edit&redlink=1">Vadim Kurchevskiy</a> and <a href="http://en.wikipedia.org/wiki/Nikolay_Serebryakov">Nikolay Serebryakov</a>, who worked together for their first films, e.g. <em><a href="http://en.wikipedia.org/w/index.php?title=The_Cloud_in_Love&action=edit&redlink=1">The Cloud in Love</a></em> (1963). Even when they decided to separate and make their own films, their style was marked by an extensive aesthetic search for, as Bendazzi puts it, "the combination of realism and the baroque", most clearly to be seen in <em><a href="http://en.wikipedia.org/w/index.php?title=Not_in_the_Hat_is_there_Happiness&action=edit&redlink=1">Not in the Hat is there Happiness</a></em> (1968, by Serebrjakov) and especially in Kurchevskiy's masterpiece, <em><a href="http://en.wikipedia.org/w/index.php?title=The_Master_of_Clamecy&action=edit&redlink=1">The Master of Clamecy</a></em> (1972, after <a href="http://en.wikipedia.org/wiki/Romain_Rolland">Romain Rolland</a>'s novel <em>Colas Breugnon</em>). One generation later, <a href="http://en.wikipedia.org/wiki/Stanislav_Sokolov">Stanislav Sokolov</a> started to make movies that brought the art of puppet animation to a new height. His approach, characterized by complex animation structures and multiple special effects can well be observed in <em><a href="http://en.wikipedia.org/w/index.php?title=The_Big_Underground_Ball&action=edit&redlink=1">The Big Underground Ball</a></em> (1987, after <a href="http://en.wikipedia.org/wiki/Andersen">Andersen</a>) or <em>Black and White Film</em> (1985), which won a prize in <a href="http://en.wikipedia.org/wiki/Zagreb">Zagreb</a>.</p>
# <p><a href="http://en.wikipedia.org/w/index.php?title=Anatoly_Petrov&action=edit&redlink=1">Anatoly Petrov</a>, the founder of <em><a href="http://en.wikipedia.org/w/index.php?title=The_Happy_Merry-Go-Round&action=edit&redlink=1">The Happy Merry-Go-Round</a></em> (<a href="http://en.wikipedia.org/wiki/Russian_language">Russian</a>: Весёлая карусель, 1969), has shown extreme realism (close to photorealistic) in his later films, most notable of which was science fiction <em><a href="http://en.wikipedia.org/wiki/Polygon_(film)">Polygon</a></em> (<a href="http://en.wikipedia.org/wiki/Russian_language">Russian</a>: Полигон, 1977).</p>
# <p>His colleague <a href="http://en.wikipedia.org/w/index.php?title=Gennady_Sokolsky&action=edit&redlink=1">Gennady Sokolsky</a> tried to use attractive characters in his films, combined with ambient soundtrack: <em><a href="http://en.wikipedia.org/w/index.php?title=Serebryanoe_kopytce&action=edit&redlink=1">Serebryanoe kopytce</a></em> (<a href="http://en.wikipedia.org/wiki/Russian_language">Russian</a>: Серебряное копытце, 1977), <em><a href="http://en.wikipedia.org/w/index.php?title=Myshonok_Pik&action=edit&redlink=1">Myshonok Pik</a></em>(<a href="http://en.wikipedia.org/wiki/Russian_language">Russian</a>: Мышонок Пик, 1978), <em><a href="http://en.wikipedia.org/wiki/The_Adventures_of_Scamper_the_Penguin">The Adventures of Scamper the Penguin</a></em> (<a href="http://en.wikipedia.org/wiki/Russian_language">Russian</a>: Приключения пингвинёнка Лоло, 1986–1987, with <a href="http://en.wikipedia.org/wiki/Kinjiro_Yoshida">Kinjiro Yoshida</a>).</p>
# <p><a href="http://en.wikipedia.org/wiki/Roman_Abelevich_Kachanov">Roman Kachanov</a> made numerous films for children, starting from <a href="http://en.wikipedia.org/wiki/Puppet_animation">puppet animation</a> (<em><a href="http://en.wikipedia.org/w/index.php?title=Varezhka_(film)&action=edit&redlink=1">Varezhka</a></em> (1967), <em><a href="http://en.wikipedia.org/wiki/Cheburashka_(film)">Cheburashka</a></em> series), and later with <a href="http://en.wikipedia.org/wiki/Traditional_animation">traditional animation</a> in famous animated movie <em><a href="http://en.wikipedia.org/wiki/The_Mystery_of_the_Third_Planet">The Mystery of the Third Planet</a></em> based on <a href="http://en.wikipedia.org/wiki/Alice:_The_Girl_from_Earth">Alice: The Girl from Earth</a> books by writer <a href="http://en.wikipedia.org/wiki/Kir_Bulychov">Kir Bulychov</a> (1981).</p>
# <p><a href="http://en.wikipedia.org/wiki/Sverdlovsk_Film_Studio">Sverdlovsk Film Studio</a> introduced <a href="http://en.wikipedia.org/wiki/Paint-on-glass_animation">paint-on-glass animation</a> with complete new level of quality (<em><a href="http://en.wikipedia.org/w/index.php?title=Dobro_Pozhalovat!&action=edit&redlink=1">Dobro Pozhalovat!</a></em> <a href="http://en.wikipedia.org/wiki/Russian_language">Russian</a>: Добро пожаловать!, 1986).</p>
# <p><a href="http://en.wikipedia.org/wiki/File:Hedgehogprint2.jpg"><img alt="" src="http://upload.wikimedia.org/wikipedia/en/thumb/6/61/Hedgehogprint2.jpg/220px-Hedgehogprint2.jpg" width="220" height="165" srcset="//upload.wikimedia.org/wikipedia/en/thumb/6/61/Hedgehogprint2.jpg/330px-Hedgehogprint2.jpg 1.5x, //upload.wikimedia.org/wikipedia/en/6/61/Hedgehogprint2.jpg 2x"></a></p>
# <p><em><a href="http://en.wikipedia.org/wiki/Hedgehog_in_the_Fog">Hedgehog in the Fog</a></em> (1975)</p>
# <p>One of the most famous Russian animators is <a href="http://en.wikipedia.org/wiki/Yuriy_Norshteyn">Yuriy Norshteyn</a>. His films <em><a href="http://en.wikipedia.org/wiki/Hedgehog_in_the_Fog">Little Hedgehog in the Fog</a></em> (1975) and <em><a href="http://en.wikipedia.org/wiki/Tale_of_Tales_(film)">Tale of Tales</a></em> (1979) show not only technical mastery (although not smooth animation), but also an unrivaled magic beauty. <em>Tale of Tales</em> was elected best animation film of all time during the 1984 <a href="http://en.wikipedia.org/w/index.php?title=Olympic_Arts_Festival&action=edit&redlink=1">Olympic Arts Festival</a> in Los Angeles, and again in 2002.</p>
# <p>Since the beginning of <a href="http://en.wikipedia.org/wiki/Perestroika">Perestroika</a>, Norshteyn has not found a possibility to finish his last film, <em><a href="http://en.wikipedia.org/wiki/The_Overcoat_(animated_film)">The Overcoat</a></em>.</p>
# <p>Other directors were more able to cope with the changes that this time brought; they even commented on it in their films. <a href="http://en.wikipedia.org/wiki/Garri_Bardin">Garri Bardin</a>'s <em><a href="http://en.wikipedia.org/w/index.php?title=Little_Red_Ridinghood_et_le_Wolf&action=edit&redlink=1">Little Red Ridinghood et le Wolf</a></em> (1991) not only provoked by including a foreign language into the title, it also was full of allusions to the upcoming end of communism. <a href="http://en.wikipedia.org/wiki/Aleksandr_Tatarskiy">Aleksandr Tatarskiy</a> even managed to found his own studio (<em><a href="http://en.wikipedia.org/wiki/Pilot_(studio)">Pilot</a></em>) in 1988, where he produced absurd films inspired by the Zagreb School. Yuriy Norshteyn and three other leading animators (<a href="http://en.wikipedia.org/wiki/Fyodor_Khitruk">Fyodor Khitruk</a>, <a href="http://en.wikipedia.org/wiki/Andrei_Khrzhanovsky">Andrei Khrzhanovsky</a>, and <a href="http://en.wikipedia.org/w/index.php?title=Eduard_Nazarov&action=edit&redlink=1">Eduard Nazarov</a>) founded a school and studio in 1993 which exists to this day, called <a href="http://en.wikipedia.org/w/index.php?title=SHAR_Studio&action=edit&redlink=1">SHAR Studio</a>.</p>
# <p>In the late days of <a href="http://en.wikipedia.org/w/index.php?title=Ekran_studio&action=edit&redlink=1">Studio Ekran</a> (then Multtelefilm), <a href="http://en.wikipedia.org/w/index.php?title=Gennady_Tishchenko&action=edit&redlink=1">Gennady Tishchenko</a> introduced elements of anime style in Russian animation (<em><a href="http://en.wikipedia.org/w/index.php?title=Vampires_of_Geona&action=edit&redlink=1">Vampires of Geona</a></em><a href="http://en.wikipedia.org/wiki/Russian_language">Russian</a>: Вампиры Геоны, 1991, <em><a href="http://en.wikipedia.org/w/index.php?title=AMBA_(film)&action=edit&redlink=1">AMBA</a></em> <a href="http://en.wikipedia.org/wiki/Russian_language">Russian</a>: <a href="http://ru.wikipedia.org/wiki/%D0%90%D0%9C%D0%91%D0%90">АМБА</a>, 1994–1995).</p>
# <p>Information taken from <a href="http://en.wikipedia.org/wiki/History_of_Russian_animation">Wikipedia article "History of Russian animation"</a> version from October 18, 2013.</p>
# EOS
#   },
#   {
#     title: "Russian animation today",
#     slug: "russian-animation-today",
#     parent: content_pages_top_lvl[1],
#     prior: 4,
#     body: <<-EOS
# <h1>Russian animation today</h1>
# <p>
#     After the end of the 
#   <a href="http://en.wikipedia.org/wiki/Soviet_Union">Soviet Union</a>, the situation for Russian animators changed dramatically. On one hand, State subsidies diminished significantly. On the other hand, the number of <a href="http://en.wikipedia.org/wiki/Studio">studios</a> competing for that amount of money rose a good deal. Most of the studios during the 1990s lived on animation for advertisement and on doing commissioned works for big studios from America and elsewhere. Nevertheless, there were a few very successful international co-productions, e.g. <a href="http://en.wikipedia.org/wiki/Aleksandr_Petrov_(animator)">Aleksandr Petrov</a>'s (former <a href="http://en.wikipedia.org/wiki/Sverdlovsk_Film_Studio">Sverdlovsk Film Studio</a> animator) <a href="http://en.wikipedia.org/wiki/Academy_Awards">Oscar</a>-winning <em><a href="http://en.wikipedia.org/wiki/The_Old_Man_and_the_Sea_(1999_film)">The Old Man and the Sea</a></em> (1999, from<a href="http://en.wikipedia.org/wiki/Ernest_Hemingway">Ernest Hemingway</a>'s <a href="http://en.wikipedia.org/wiki/The_Old_Man_and_the_Sea">novel</a>) or <a href="http://en.wikipedia.org/wiki/Stanislav_Sokolov">Stanislav Sokolov</a>'s <em><a href="http://en.wikipedia.org/wiki/Shakespeare:_The_Animated_Tales">The Winter's Tale</a></em> (1999, from <a href="http://en.wikipedia.org/wiki/William_Shakespeare">William Shakespeare</a>'s play) that earned the director an <a href="http://en.wikipedia.org/wiki/Emmy">Emmy</a>.
# </p>
# <p>
#   <a href="http://en.wikipedia.org/wiki/Soyuzmultfilm">Soyuzmultfilm</a>, the former juggernaut of Russian animation studios (at one time employing as many as 700 animators and other staff), was beset by corrupt administrators who sold off all the rights to all the films previously made by the studio without telling shareholders or employees. Georgiy Borodin writes of this time, "artistic work at the studio became psychologically unbearable and impossible. No one had the guarantee that come morning, he would not find his cabinet broken open, and his working table – cleared. Similar cases became almost a regular occurrence during the years of occupation. Animators who worked in other studios refused to believe the tales about the working conditions at the stolen "Soyuzmultfilm".
# </p>
# <p>
#     Despite the hardships, Natalya Lukinykh has estimated that Russian animated films won about twice as many prestigious international awards in the 1990s as Russian live-action films. As Russia's economic situation became increasingly stable, so did the market for animation, and during the last three years a number of feature-length animation films from Russian studios have emerged (e.g. 
#   <a href="http://en.wikipedia.org/wiki/Melnitsa_Animation_Studio">Melnitsa Animation Studio</a>'s <em><a href="http://en.wikipedia.org/wiki/Little_Longnose">Little Longnose</a></em>, 2003, from <a href="http://en.wikipedia.org/wiki/Wilhelm_Hauff">Wilhelm Hauff</a>'s fairy tale, and <a href="http://en.wikipedia.org/w/index.php?title=Solnechny_Dom&action=edit&redlink=1">Solnechny Dom Studio</a>'s 2006 <em><a href="http://en.wikipedia.org/wiki/Prince_Vladimir_(film)">Prince Vladimir</a></em>, based on early history of <a href="http://en.wikipedia.org/wiki/Kievan_Rus%27">Rus'</a> – the highest-grossing Russian animated film to date). While the Russian animation community is yet far from reaching the splendor it possessed before the end of the Soviet Union, a significant recovery is being made and it is becoming more and more clear that the revived Russian animation industry will be very different from what it was in the late 1980s. According to <a href="http://en.wikipedia.org/w/index.php?title=Andrei_Dobrunov&action=edit&redlink=1">Andrei Dobrunov</a>, head of Solnechny Dom, several Russian studios are currently working on some ten animated feature films.
# </p>
# <p>
#   <a href="http://en.wikipedia.org/wiki/File:A_snapshot_from_the_2012_demo_release_from_the_Morvena_Project.png"><img alt="" src="http://upload.wikimedia.org/wikipedia/en/thumb/1/14/A_snapshot_from_the_2012_demo_release_from_the_Morvena_Project.png/200px-A_snapshot_from_the_2012_demo_release_from_the_Morvena_Project.png" width="200" height="113" srcset="//upload.wikimedia.org/wikipedia/en/thumb/1/14/A_snapshot_from_the_2012_demo_release_from_the_Morvena_Project.png/300px-A_snapshot_from_the_2012_demo_release_from_the_Morvena_Project.png 1.5x, //upload.wikimedia.org/wikipedia/en/1/14/A_snapshot_from_the_2012_demo_release_from_the_Morvena_Project.png 2x" style="border: 1px solid rgb(204, 204, 204); vertical-align: middle;"></a>
# </p>
# <p>
#   <a href="http://en.wikipedia.org/wiki/Synfig#Uses">Morvena Project</a>
# </p>
# <p>
#   <em><a href="http://en.wikipedia.org/w/index.php?title=Osobennyj&action=edit&redlink=1">Osobennyj</a></em>, released July 31, 2006, was Russia's first <a href="http://en.wikipedia.org/wiki/3D_computer_graphics">CG-animated</a> feature film. About 8 such films are now in production by various studios. At the same time, Soyuzmultfilm has partnered up with <a href="http://en.wikipedia.org/wiki/Mikhail_Shemyakin">Mikhail Shemyakin</a> and is working on <em><a href="http://en.wikipedia.org/wiki/Gofmaniada">Gofmaniada</a></em>, a puppet-animated feature film which is deliberately being made entirely without computers. In 2007, the <a href="http://en.wikipedia.org/wiki/Synfig#Usage">Morevna Project</a> was launched, aiming at creating a <a href="http://en.wikipedia.org/wiki/Science_fiction">science fiction</a> re-telling the folk-tale of <a href="http://en.wikipedia.org/wiki/The_Death_of_Koschei_the_Deathless">Marya Morevna</a> as an <a href="http://en.wikipedia.org/wiki/Anime">anime</a> primarily by using the <a href="http://en.wikipedia.org/wiki/Free_software">free software</a> <a href="http://en.wikipedia.org/wiki/Synfig">Synfig</a> tool and releasing it under a <a href="http://en.wikipedia.org/wiki/Creative_Commons">Creative Commons</a> license.</p>
# <p>Beginning in 2009, animation entered a new crisis as <a href="http://en.wikipedia.org/wiki/Goskino">Goskino</a> indefinitely postponed funding for all projects, and for the 2010 budget the state cut animation funding by half. The animation community reacted by appealing to the President and the public. In 2010, many of the major studios, including <a href="http://en.wikipedia.org/wiki/Pilot_(studio)">Pilot</a>, were either closed or on the verge of shutting down. The vast majority of studios had relied on state support to some extent, and Goskino did not fulfill any of their contractual obligations to pay for the films that they had ordered and which the studios had already produced. In addition, Disney has been accused of using anti-competitive practices to sideline domestic Russian competition on TV channels.</p>
# <p>Information taken from <a href="http://en.wikipedia.org/wiki/History_of_Russian_animation">Wikipedia article "History of Russian animation"</a> version from October 18, 2013.</p>
# EOS
#   },
#   {
#     title: "Socialist Realism",
#     slug: "socialist_realism",
#     parent: content_pages_top_lvl[1],
#     prior: 2,
#     body: <<-EOS
# <h1>Socialist Realism</h1>
# <p>In 1934, <a href="http://en.wikipedia.org/wiki/Walt_Disney">Walt Disney</a> sent a film reel with some shorts of <a href="http://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a> to the <a href="http://en.wikipedia.org/wiki/Moscow_Film_Festival">Moscow Film Festival</a>. <a href="http://en.wikipedia.org/wiki/Fyodor_Khitruk">Fyodor Khitruk</a>, then only an animator, recalls his impressions of that screening in an interview in <a href="http://en.wikipedia.org/w/index.php?title=Otto_Alder&action=edit&redlink=1">Otto Alder</a>'s film <em>The Spirit of Genius</em>. He was absolutely overwhelmed by the fluidity of the films' images and enthusiastic about the new possibilities for animation that Disney's ways seemed to offer.</p>
# <p>Higher officials shared this impression, too, and in 1935, the <a href="http://en.wikipedia.org/wiki/Soyuzmultfilm">Soyuzdetmultfilm</a>-Studio was created from the small and relatively independent trickfilm units of <a href="http://en.wikipedia.org/wiki/Mosfilm">Mosfilm</a>, <a href="http://en.wikipedia.org/wiki/Sovkino">Sovkino</a> and <a href="http://en.wikipedia.org/w/index.php?title=Mezhrabpromfilm&action=edit&redlink=1">Mezhrabpromfilm</a> in order to focus on the creation of Disney-style animation, exclusively using <a href="http://en.wikipedia.org/wiki/Cel">cel</a> technique.</p>
# <p>Already since 1932, when a congress of Soviet writers had proclaimed the necessity of <a href="http://en.wikipedia.org/wiki/Socialist_realism">Socialist realism</a>, the influence of <a href="http://en.wikipedia.org/wiki/Futurism_(art)">Futurism</a> and the <a href="http://en.wikipedia.org/wiki/Russian_avant-garde">Russian avant-garde</a> on animation had dwindled. Now, aesthetic experiments were shoved off the agenda, and for over twenty years, Soyuzmultfilm, as the studio was called from 1936 onwards, worked in a <a href="http://en.wikipedia.org/wiki/Frederick_Winslow_Taylor">taylorised</a> way, using cel technique and <a href="http://en.wikipedia.org/wiki/Division_of_labour">division of labour</a>. It became the leading animation studio in the <a href="http://en.wikipedia.org/wiki/Soviet_union">Soviet union</a>, producing an ever-growing number of children's and educational animation shorts and features, but the experimental spirit of the founding years was lost.</p>
# <p>One of the most alarming examples of the transformation that not only the studios underwent, but also the artists were succumbed to, is <a href="http://en.wikipedia.org/w/index.php?title=Mikhail_Tsekhanovsky&action=edit&redlink=1">Mikhail Tsekhanovsky</a>. The <a href="http://en.wikipedia.org/wiki/Saint_Petersburg">Leningrad</a>-born artist made a name for himself in book illustration and graphics. He found animation to be an ideal medium to transfer his style to and develop his artistic vision further. He became internationally renowned by his film <em>Post</em>, shot in 1929 and earning him a number of prizes at international film festivals. With the establishment of <a href="http://en.wikipedia.org/wiki/Socialist_realism">Socialist realism</a>, he had to abandon his innovative and highly convincing style for the then general practice that in Russia has come to be known as "Éclair": The filming of live action, followed by a frame-by-frame projection that had to serve the animators as their only source for the realization of movement (in the West, this is known as <a href="http://en.wikipedia.org/wiki/Rotoscope">rotoscoping</a>). The differences in visual decisions are clearly visible and characteristic for the transformation not only <a href="http://en.wikipedia.org/w/index.php?title=Mikhail_Tsekhanovskiy&action=edit&redlink=1">Mikhail Tsekhanovskiy</a>, but Soviet animation as a whole had to go through during that time.</p>
# <p>Many artists did not withstand these changes, though, and left the industry for other fields like painting or book illustrations. An example is the ingenious trio of <a href="http://en.wikipedia.org/w/index.php?title=Yuriy_Merkulov&action=edit&redlink=1">Yuriy Merkulov</a>, <a href="http://en.wikipedia.org/w/index.php?title=Zenon_Kommissarenko&action=edit&redlink=1">Zenon Kommissarenko</a> and <a href="http://en.wikipedia.org/w/index.php?title=Nikolay_Khodataev&action=edit&redlink=1">Nikolay Khodataev</a>, who after finishing their last film <em>The Barrel Organ</em> (1934) stopped working in animation.</p>
# <p>For two decades, the studio confined itself to sober and to an extent tedious adaptations of folk tales and communist myths. An exception might only be found in wartime <a href="http://en.wikipedia.org/wiki/Propaganda">propaganda</a> spots, shot during <a href="http://en.wikipedia.org/wiki/Emergency_evacuation">evacuation</a> in <a href="http://en.wikipedia.org/wiki/Samarkand">Samarkand</a> 1941–1943, but their humour is arguably unintentional. Nevertheless, directors like the sisters <a href="http://en.wikipedia.org/w/index.php?title=Zinaida_and_Valentina_Brumberg&action=edit&redlink=1">Zinaida and Valentina Brumberg</a> with films like <em>Fedya Zaitsev</em> (1948),<a href="http://en.wikipedia.org/wiki/Ivan_Ivanov-Vano">Ivan Ivanov-Vano</a> with 1954's <em>Moydodyr</em> (there is a first version from 1927, but it lacks the fluidity of the later version) or <a href="http://en.wikipedia.org/wiki/Lev_Atamanov">Lev Atamanov</a> with <em><a href="http://en.wikipedia.org/wiki/The_Snow_Queen_(1957_film)">The Snow Queen</a></em> (1957, told after <a href="http://en.wikipedia.org/wiki/Hans_Christian_Andersen">Hans Christian Andersen</a>'s tale) managed to create masterpieces of their genre that have been rewarded various prizes at festivals all over the world and have taken a lasting place in <a href="http://en.wikipedia.org/wiki/Animation_history">animation history</a>.</p>
# <p>Information taken from <a href="http://en.wikipedia.org/wiki/History_of_Russian_animation">Wikipedia article "History of Russian animation"</a> version from October 18, 2013.</p>
# EOS
#   },
#   {
#     title: "Resources",
#     slug: "resources",
#     parent: content_pages_top_lvl[1],
#     behavior_type: 2,
#     rct_page: content_pages_top_lvl[2],
#     prior: 5
#   }
# ])

# MainNavItem.create([
#   { prior: 1, url_type: 1, url_page: homepage, title: "Home" },
#   { prior: 2, url_type: 1, url_page: content_pages_top_lvl[1], title: "History" },
#   { prior: 3, url_type: 1, url_page: content_pages_top_lvl[2], title: "Resources" },
#   { prior: 4, url_type: 0, url_text: '/news', title: "News" },
#   { prior: 5, url_type: 1, url_page: content_pages_top_lvl[0], title: "Contacts" }
# ])
