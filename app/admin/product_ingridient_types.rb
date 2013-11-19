# -*- encoding : utf-8 -*-
ActiveAdmin.register ProductIngridientType do

  # config.sort_order = "prior_asc"
  config.batch_actions = false

  menu priority: 6, parent: "Товары"

  filter :name

  index download_links: false do
    column :name
    default_actions
  end

  show do |ingrtype|
    attributes_table do
      row :name
    end
    panel "Ингридиенты" do
      table_for ingrtype.ingridients do
        column "Название", :name do |ingr|
          link_to ingr.name, admin_product_ingridient_path(ingr)
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "" do
      f.input :name
    end
    f.actions
  end
end