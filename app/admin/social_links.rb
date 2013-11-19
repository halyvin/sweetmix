# -*- encoding : utf-8 -*-
ActiveAdmin.register SocialLink do

  config.sort_order = "prior_asc"
  config.batch_actions = false

  menu priority: 3, parent: "Сайт"

  actions :all, except: [ :show ]

  filter :social_type, as: :select, :collection => SocialLink.social_type_variants
  filter :url
  filter :hided

  index download_links: false do
    column(:social_type) { |scl| scl.name }
    column(:url) { |scl| link_to scl.url, scl.url, target: "_blank" }
    column :prior
    column(:hided) { |scl| scl.hided ? t('yep') : t('nope') }
    default_actions
  end

  show do |social_link|
    attributes_table do
      row(:social_type) { social_link.name }
      row(:url) { link_to social_link.url,
                          social_link.url,
                          target: "_blank" }
    end
    active_admin_comments
  end

  sidebar 'Дополнительные данные', only: :show do
    attributes_table_for resource do
      row :hided do
        resource.hided ? t('yep') : t('nope')
      end
      row :prior
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "" do
      f.input :social_type,
              as: :radio,
              collection: SocialLink.social_type_variants,
              include_blank: false
      f.input :url
      f.input :prior, hint: "Меньше значение => Раньше в списке"
      f.input :hided
    end
    f.actions
  end
end