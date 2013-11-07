# -*- encoding : utf-8 -*-
ActiveAdmin.register StaticImage do

  config.batch_actions = true

  menu parent: 'Сайт', priority: 11

  config.filters = false

  collection_action :upload_image, :method => :post do
    stimage = StaticImage.new
    stimage.image = params[:file]
    stimage.save
    render :json => { filelink: stimage.image.url }
  end

  index download_links: false do
    selectable_column
    column :image do |si|
      link_to image_tag(si.image.thumb.url), admin_static_image_path(si)
    end
    column(:url) { |si| link_to si.image.url, si.image.url }
    default_actions
  end

  show do |static_image|
    panel "Изображение" do
      div image_tag(static_image.image.url), :class => "image-guard"
    end
    active_admin_comments
  end

  sidebar 'Данные', only: :show do
    attributes_table_for static_image do
      row :url do
        link_to static_image.image.url, static_image.image.url
      end
      row :size do
        (static_image.image.file.size / 1024).to_s + " Кбайт"
      end
      row :created_at
      row :updated_at
    end
  end

  sidebar 'Информация' do
    para 'Вы можете загружать произвольные изображения и потом использовать их в любых целях - например, в контентных страницах.'
    para 'Для этого нужно скопировать ссылку изображения и использовать её при добавления изображения в редакторе (или просто в качестве src аттрибута для тэга img).'
    para 'Изображения, загруженные из редактора, так же отображаются в этом списке.'
  end

  form do |f|
    f.inputs "" do
      f.input :image, hint: ("Допустимые форматы .jpg, .jpeg, .png, .gif" + (f.object.image.present? && !f.object.new_record? ? "<br />Текущее изображение:<br />" + image_tag(f.object.image.thumb.url) : "")).html_safe
    end
    f.actions
  end

end
