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
          set_val: "The page of Mayak Rails Site Template"
        },
        {
          ident: "default_page_keywords",
          name: "Ключевые слова сайта по умолчанию",
          descr: "Содержание тэга keywords на главной странице и на всех страницах, где не указано иное",
          set_val: "sweetmix, мюсли, кексы, кондитерская продукция"
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
