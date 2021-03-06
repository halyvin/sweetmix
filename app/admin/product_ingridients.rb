# -*- encoding : utf-8 -*-
ActiveAdmin.register ProductIngridient do

  # config.sort_order = "prior_asc"
  config.batch_actions = false

  menu priority: 5, parent: "Товары"

  filter :name
  filter :type

  index download_links: false do
    column :image do |ingr|
      image_tag ingr.image.url
    end
    column :name
    column :type
    default_actions
  end

  show do |ingr|
    attributes_table do
      row :name
      row :type
      row :image do
        ingr.image.blank? ? "" : image_tag(ingr.image.url)
      end
      row :descr
      row :proteins
      row :fats
      row :carbohydrates
      row :calories
    end
    panel "Относительно упаковок" do
      table_for ingr.ingridients_packs_relations do
        column "Название", :product_pack do |ipr|
          link_to ipr.product_pack.name, admin_product_pack_path(ipr.product_pack)
        end
        column "Вес", :weight
        column "Стоимость", :price
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "" do
      f.input :name
      f.input :type
      f.input :image, hint: ("Допустимые форматы .jpg, .jpeg, .png, .gif" + (f.object.image.present? && !f.object.new_record? ? "<br />Текущее изображение:<br />" + image_tag(f.object.image.url) : "")).html_safe
      f.input :descr
      f.input :proteins, as: :number, input_html: { style: "width: 140px" }
      f.input :fats, as: :number, input_html: { style: "width: 140px" }
      f.input :carbohydrates, as: :number, input_html: { style: "width: 140px" }
      f.input :calories, as: :number, input_html: { style: "width: 140px" }
    end
    f.inputs do
      f.has_many :ingridients_packs_relations do |nlink|
        nlink.input :product_pack
        nlink.input :price
        nlink.input :weight
        nlink.input :_destroy, :as => :boolean, :label => "Удалить?"
      end
    end
    f.actions
  end
end