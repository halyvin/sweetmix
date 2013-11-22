# -*- encoding : utf-8 -*-
class CreateSiteSettings < ActiveRecord::Migration
  def migrate(direction)
    super
    if direction == :up
      SiteSetting.create!([
        {
          ident: "default_page_title",
          name: "Заголовок сайта по умолчанию",
          descr: "Отображается на главной странице и на всех страницах, после указанного заголовка этой страницы",
          set_val: "SweetMix - оn-line кондитерская"
        },
        {
          ident: "default_page_description",
          name: "Описание сайта по умолчанию",
          descr: "SweetMix - оn-line кондитерская",
          set_val: "Онлайн-кондитерская, в которой вы можете выбрать готовую продукцию или создать её самостоятельно!"
        },
        {
          ident: "default_page_keywords",
          name: "Ключевые слова сайта по умолчанию",
          descr: "Содержание тэга keywords на главной странице и на всех страницах, где не указано иное",
          set_val: "sweetmix, мюсли, кексы, кондитерская продукция"
        },
        {
          ident: "manager_email",
          name: "Email менеджера сайта",
          descr: "Адрес электронной почты, на который будут приходить уведомления с сайта: заказы звонков, сообщения со страницы контактов, сообщения о заказах",
          set_val: "mstrdymio@gmail.com"
        },
        {
          ident: "major_site_phone",
          name: "Главный телефон сайта",
          descr: "Телефон, который отображается в шапке сайта",
          set_val: "+7 (913) 234-1212"
        },
        {
          ident: "page_of_contacts",
          name: "Страница с контактной информацией",
          descr: "Контентная страница, на которой расположена контактная информация; на этой странице расположена форма контактных данных",
          val_type: 4
        },
        {
          ident: "page_of_sertificates",
          name: "Страница с сертификатами",
          descr: "Контентная страница, на которой расположены подарочные сертификаты",
          val_type: 4
        },
        {
          ident: "page_of_comments",
          name: "Страница с отзывами о сайте",
          descr: "Контентная страница, на которой расположены отзывы о сайте и форма добавления нового отзыва",
          val_type: 4
        }
      ])
    end
  end

  def change
    create_table :site_settings do |t|
      t.string  :ident,     null: false
      t.string  :name
      t.string  :descr
      t.integer :val_type
      t.text    :set_val
      t.boolean :hided,     null: false, default: false

      t.timestamps
    end
    add_index :site_settings, :ident
    add_index :site_settings, :hided
  end
end
