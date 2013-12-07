# -*- encoding : utf-8 -*-
ActiveAdmin.register InfoProductCircle do

  config.sort_order = "prior_asc"
  config.batch_actions = false

  menu priority: 5, parent: "Сайт"

  actions :all, except: [:show]

  filter :title

  index download_links: false do
    column :title
    column :url do |ipc|
      ipc.url.present? ? link_to(ipc.url, ipc.url) : ""
    end
    column :prodcode do |ipc|
      ["Мюсли", "Выпечка", "Мороженое", "Йогурт"][ipc.prodcode]
    end
    column :prior
    column(:hided) { |ipc| ipc.hided ? t('yep') : t('nope') }
    default_actions
  end

  # show do |ipc|
  #   attributes_table do
  #     row :title
  #     row :url
  #     row :prodcode do
  #       ["Мюсли", "Выпечка", "Мороженое", "Йогурт"][ipc.prodcode]
  #     end
  #     row :hided do
  #       ipc.hided? ? t('yep') : t('nope')
  #     end
  #     row :prior
  #   end
  #   active_admin_comments
  # end

  form do |f|
    f.inputs "" do
      f.input :title
      f.input :url
      f.input :prodcode, as: :select,
                         collection: [ ["Мюсли", 0],
                                       ["Выпечка", 1],
                                       ["Мороженое", 2],
                                       ["Йогурт", 3] ],
                         include_blank: false
      f.input :prior, hint: "Меньше значение => Раньше в списке"
      f.input :hided
    end
    f.actions
  end
end