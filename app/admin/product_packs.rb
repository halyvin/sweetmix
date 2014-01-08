# -*- encoding : utf-8 -*-
ActiveAdmin.register ProductPack do

  # config.sort_order = "prior_asc"
  config.batch_actions = false

  menu priority: 3, parent: "Товары"

  filter :name
  filter :capacity
  filter :category

  index download_links: false do
    column :image do |pack|
      image_tag pack.image.thumb.url
    end
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
      row :image do
        pack.image.blank? ? "" : image_tag(pack.image.url)
      end
    end

    panel "Основы", style: "overflow: hidden" do
      pack.bases_packs_relations.each do | bpr |
        div(:style => "float: left; margin: 0 14px 14px 0; border: 1px dashed #666; padding: 0 6px;") do
          attributes_table_for bpr do
            row :product_basis
            row :weight
            row :price
            row(:image) { image_tag(bpr.product_basis.image.url) }
          end
        end
      end
    end if pack.bases_packs_relations.any?

    # panel "Основы" do
    #   table_for pack.bases_packs_relations do
    #     column "Изображение", :image do |bpr|
    #       image_tag bpr.product_basis.image.url, size: "47x47"
    #     end
    #     column "Название", :product_basis do |bpr|
    #       link_to bpr.product_basis.name, admin_product_basis_path(bpr.product_basis)
    #     end
    #     column "Вес", :weight
    #     column "Стоимость", :price
    #   end
    # end

    panel "Ингредиенты", style: "overflow: hidden" do
      pack.ingridients_packs_relations.each do | ipr |
        div(:style => "float: left; margin: 0 14px 14px 0; border: 1px dashed #666; padding: 0 6px;") do
          attributes_table_for ipr do
            row :product_ingridient
            row :weight
            row :price
            row(:image) { image_tag(ipr.product_ingridient.image.url) }
          end
        end
      end
    end if pack.ingridients_packs_relations.any?

    # panel "Ингредиенты" do
    #   table_for pack.ingridients_packs_relations do
    #     column "Изображение", :image do |ipr|
    #       image_tag ipr.product_ingridient.image.url, size: "47x47"
    #     end
    #     column "Название", :product_basis do |ipr|
    #       link_to ipr.product_ingridient.name, admin_product_ingridient_path(ipr.product_ingridient)
    #     end
    #     column "Вес", :weight
    #     column "Стоимость", :price
    #   end
    # end
    
    active_admin_comments
  end

  form do |f|
    f.inputs "" do
      f.input :category
      f.input :name
      f.input :capacity
      f.input :image, hint: ("Допустимые форматы .jpg, .jpeg, .png, .gif" + (f.object.image.present? && !f.object.new_record? ? "<br />Текущее изображение:<br />" + image_tag(f.object.image.thumb.url) : "")).html_safe
    end
    f.actions
  end
end