# -*- encoding : utf-8 -*-
ActiveAdmin.register ProductBasis do

  # config.sort_order = "prior_asc"
  config.batch_actions = false

  menu priority: 4, parent: "Товары"

  filter :name

  index download_links: false do
    column :name
    default_actions
  end

  show do |basis|
    attributes_table do
      row :name
      row :descr
      row :composition
    end
    panel "Для упаковок" do
      table_for basis.bases_packs_relations do
        column "Название", :product_pack do |bpr|
          link_to bpr.product_pack.name, admin_product_pack_path(bpr.product_pack)
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
      f.input :descr
      f.input :composition
    end
    f.inputs do
      f.has_many :bases_packs_relations do |nlink|
        nlink.input :product_pack
        nlink.input :price
        nlink.input :weight
        nlink.input :_destroy, :as => :boolean, :label => "Удалить?"
      end
    end
    f.actions
  end
end