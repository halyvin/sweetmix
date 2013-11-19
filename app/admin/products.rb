# -*- encoding : utf-8 -*-
ActiveAdmin.register Product do

  config.sort_order = "article_asc"
  config.batch_actions = false

  menu false # priority: 1, parent: "Товары"

  filter :article
  filter :name
  filter :category
  filter :plain
  filter :price
  filter :pack
  filter :basis
  filter :weight


  index download_links: false do
    column :article
    column :name
    column :category
    column(:plain) { |pr| pr.plain? ? t('yep') : t('nope') }
    column :price
    column :pack
    column :basis
    column :weight
    default_actions
  end

  show do |pr|
    attributes_table do
      row :article
      row :name
      row :category
      row(:plain) { pr.plain? ? t('yep') : t('nope') }
      row :price
      row :pack
      row :basis
      row :weight
    end
    panel "Ингридиенты" do
      table_for pr.ingridients do
        column "Название", :name
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "" do
      f.input :article
      f.input :name
      f.input :category
      f.input :plain
      f.input :price
      f.input :pack
      f.input :basis
      f.input :weight
    end
    f.actions
  end
end