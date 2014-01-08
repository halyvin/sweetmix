# -*- encoding : utf-8 -*-
ActiveAdmin.register Product do

  config.batch_actions = false

  menu priority: 1, parent: "Товары"

  controller do
    def scoped_collection
      Product.precreated
    end
  end

  filter :name
  filter :price
  filter :plain
  filter :category
  filter :pack
  filter :basis
  filter :weight
  filter :hided

  index download_links: false do
    column :name
    column :price
    column "Информация" do |pr|
      if pr.plain?
        image_tag pr.image.url
      else
        [ pr.category.name,
          pr.pack.name,
          pr.basis.name,
          "#{pr.weight} грамм" ].join('<br>').html_safe
      end
    end
    column(:hided) { |pr| pr.hided? ? t('yep') : t('nope') }
    default_actions
  end

  show do |pr|
    attributes_table do
      row :name
      row :price
      row :descr
      row(:image) { image_tag(pr.image.url) }
      unless pr.plain?
        row :category
        row :pack
        row :basis
        row :weight
      end
    end
    unless pr.plain?
      panel "Ингридиенты" do
        table_for pr.ingridients do
          column "Название", :name
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "" do
      f.input :name
      f.input :own_descr, input_html: { rows: 3 }
      f.input :own_image, hint: "Допустимые форматы .jpg, .jpeg, .png, .gif"
      f.input :price
      f.input :hided
      if f.object.new_record? && f.object.pcba = true && f.object.plain = true
        f.input :pcba, as: :hidden
        f.input :plain, as: :hidden
      end
    end
    f.actions
  end
end