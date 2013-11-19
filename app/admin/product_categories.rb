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
    
    panel "Упаковки", style: "overflow: hidden" do
      categ.packs.each do | pack |
        div(:style => "float: left; margin: 0 14px 14px 0; border: 1px dashed #666; padding: 0 6px;") do
          attributes_table_for pack do
            row :name
            row :capacity
            row(:image) { image_tag(pack.image.url) }
          end
        end
      end
    end if categ.packs.any?

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