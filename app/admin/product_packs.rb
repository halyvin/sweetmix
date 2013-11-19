# -*- encoding : utf-8 -*-
ActiveAdmin.register ProductPack do

  # config.sort_order = "prior_asc"
  config.batch_actions = false

  menu priority: 3, parent: "Товары"

  filter :name
  filter :capacity
  filter :category

  index download_links: false do
    column :name
    column :capacity
    column :category
    default_actions
  end

  show do |pack|
    attributes_table do
      row :category
      row :name
      row :capacity
    end
    panel "Основы" do
      table_for pack.bases_packs_relations do
        column "Название", :product_basis do |bpr|
          link_to bpr.product_basis.name, admin_product_basis_path(bpr.product_basis)
        end
        column "Вес", :weight
        column "Стоимость", :price
      end
    end
    panel "Ингридиенты" do
      table_for pack.ingridients_packs_relations do
        column "Название", :product_basis do |ipr|
          link_to ipr.product_ingridient.name, admin_product_ingridient_path(ipr.product_ingridient)
        end
        column "Вес", :weight
        column "Стоимость", :price
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "" do
      f.input :category
      f.input :name
      f.input :capacity
    end
    f.actions
  end
end