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
    panel "Ингредиенты" do
      table_for ingrtype.ingridients do
        column "Название", :name do |ingr|
          link_to ingr.name, admin_product_ingridient_path(ingr)
        end
      end
    end
    panel "Ингредиенты", style: "overflow: hidden" do
      ingrtype.ingridients.each do | ingr |
        div(:style => "float: left; margin: 0 14px 14px 0; border: 1px dashed #666; padding: 0 6px;") do
          attributes_table_for ingr do
            row :name, label: ""
            row(:image) { image_tag(ingr.image.url) }
          end
        end
      end
    end if ingrtype.ingridients.any?
    active_admin_comments
  end

  form do |f|
    f.inputs "" do
      f.input :name
    end
    f.actions
  end
end