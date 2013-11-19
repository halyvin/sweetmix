# -*- encoding : utf-8 -*-
ActiveAdmin.register ProductCategory do

  # config.sort_order = "prior_asc"
  config.batch_actions = false

  menu priority: 2, parent: "Товары"

  filter :name_other, label: "Название"
  filter :slug

  index download_links: false do
    column :name
    column :slug
    default_actions
  end

  show do |categ|
    attributes_table do
      row :name_one
      row :name_other
      row :name_few
      row :name_many
      row :slug
    end
    panel "Упаковки" do
      table_for categ.packs do
        column "Название", :name do |pk|
          link_to pk.name, admin_product_pack_path(pk)
        end
        column "Ёмкость", :capacity
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "" do
      f.input :name_one
      f.input :name_other
      f.input :name_few
      f.input :name_many
      f.input :slug
    end
    f.actions
  end
end