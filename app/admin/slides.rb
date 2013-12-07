# -*- encoding : utf-8 -*-
ActiveAdmin.register Slide do

  config.sort_order = "prior_asc"
  config.batch_actions = false

  menu priority: 4, parent: "Сайт"

  filter :title
  filter :btn_text
  filter :hided

  index download_links: false do
    column :title
    column "Кнопка" do |sl|
      sl.btn_link.present? ? link_to(sl.btn_text, sl.btn_link) : ""
    end
    column :prior
    column(:hided) { |sl| sl.hided ? t('yep') : t('nope') }
    default_actions
  end

  show do |slide|
    attributes_table do
      row :title
      row :subtitle
      row :descr
      row :image do
        slide.image.blank? ? "" : image_tag(slide.image.url)
      end
      row :image_at_right do
        slide.image_at_right? ? t('yep') : t('nope')
      end
      row :backg do
        slide.backg.present? ? ["Без фона", "Колоски слева", "Кекс справа"][slide.backg] : "Без фона"
      end
      row :custom do
        slide.custom? ? t('yep') : t('nope')
      end
      row :btn_text
      row :btn_link
    end
    active_admin_comments
  end

  sidebar 'Дополнительные данные', only: :show do
    attributes_table_for resource do
      row :hided do
        resource.hided? ? t('yep') : t('nope')
      end
      row :prior
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "" do
      f.input :title
      f.input :subtitle
      f.input :descr
      f.input :image, hint: 'Допустимые форматы .jpg, .jpeg, .png, .gif'
      f.input :image_at_right
      f.input :custom
      f.input :backg, as: :radio,
                      collection: [ ["Без фона", nil],
                                    ["Колоски слева", 1],
                                    ["Кекс справа", 2] ]
      f.input :btn_text
      f.input :btn_link
      f.input :prior, hint: "Меньше значение => Раньше в списке"
      f.input :hided
    end
    f.actions
  end
end