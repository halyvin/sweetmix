# -*- encoding : utf-8 -*-
ActiveAdmin.register Order do

  config.sort_order = "dlv_date_desc"
  config.batch_actions = false
  config.filters = true

  # menu priority: 1

  index download_links: false do
    column "#", :id
    column "Сумма", :price
    column("Статус", :pay_status) {|order| ["Наличн", "Онлайн (неопл.)", "Онлайн (опл!)"][order.pay_status] }
    column "Клиент", :clt_first_name do |order|
      (order.clt_full_name + "<br>" + mail_to(order.clt_email)).html_safe
    end
    column("Доставка", :dlv_date) {|order| (I18n.l(order.dlv_date) + "<br>" + order.dlv_period.to_s).html_safe }
    # column "Информация" do |pr|
    #   if pr.plain?
    #     image_tag pr.image.url
    #   else
    #     [ pr.category.name,
    #       pr.pack.name,
    #       pr.basis.name,
    #       "#{pr.weight} грамм" ].join('<br>').html_safe
    #   end
    # end
    # column(:hided) { |pr| pr.hided? ? t('yep') : t('nope') }
    default_actions
  end

  # show do |page|
  #   attributes_table do
  #     unless page.home?
  #       row :title
  #       row :page_path do
  #         link_to page.full_slug, page.page_path, target: "_blank"
  #       end
  #       row :parent
  #     end

  #     unless (page == SiteSetting.value_of('page_of_contacts') ||
  #             page == SiteSetting.value_of('page_of_sertificates') ||
  #             page == SiteSetting.value_of('page_of_comments') )
  #       row :behavior_type do
  #         page.behavior_type_humanized
  #       end
  #       row :rct_page if page.behavior_type == 2
  #       row :rct_lnk do
  #         page.rct_lnk.present? ? link_to(page.rct_lnk, page.rct_lnk) : ""
  #       end if page.behavior_type == 3
  #     end
  #     unless page.redirector?
  #       row :body do
  #         page.body.nil? ? '' : page.body.html_safe
  #       end
  #       row :description do
  #         (page.description.nil? || page.description == "") ? '<span style="color:#bbb">Используется значение по умолчанию, заданное в настройках</span>'.html_safe : page.description
  #       end
  #       row :keywords do
  #         (page.keywords.nil? || page.keywords == "") ? '<span style="color:#bbb">Используется значение по умолчанию, заданное в настройках</span>'.html_safe : page.keywords
  #       end
  #     end
  #   end
  #   active_admin_comments
  # end

  # sidebar 'Дополнительные данные', only: :show do
  #   attributes_table_for resource do
  #     row :hided do
  #       resource.hided ? t('yep') : t('nope')
  #     end
  #     row :prior
  #     row :created_at
  #     row :updated_at
  #   end
  # end

  # form do |f|
  #   f.inputs "" do
  #     unless f.object.home?
  #       f.input :title
  #       f.input :slug, hint: 'Часть URL адреса, которая обозначает эту страницу. Например для адреса `example.com/dictionary/pages/foton.html` часть `foton` - slug страницы. Больше - в <a href="http://en.wikipedia.org/wiki/Slug_(web_publishing)#Slug">Википедии</a>. Для главной страницы нужно просто оставить поле пустым.'.html_safe
  #       f.input :parent_id,
  #               as: :select,
  #               collection: content_pages_tree_ordered_collection(true, f.object, true),
  #               include_blank: true,
  #               input_html: { :class => 'chzn-select' }
  #     end
  #     unless (f.object == SiteSetting.value_of('page_of_contacts') ||
  #             f.object == SiteSetting.value_of('page_of_sertificates') ||
  #             f.object == SiteSetting.value_of('page_of_comments') )
  #       f.input :behavior_type,
  #               as: :radio,
  #               collection: ContentPage.behavior_type_variants,
  #               include_blank: false
  #       f.input :rct_page,
  #               collection: content_pages_tree_ordered_collection(false, f.object),
  #               input_html: { :class => 'chzn-select' }
  #       f.input :rct_lnk
  #     end
  #     f.input :body, input_html: { :class => ( f.object.home? ? '' : 'editor' ) }
  #     f.input :prior, hint: "Меньше значение => Раньше в списке"
  #     f.input :hided
  #   end
  #   f.inputs "SEO параметры" do
  #     f.input :description
  #     f.input :keywords
  #   end
  #   f.actions
  # end

  # sidebar 'Памятка', only: :edit do
  #   para "Прошу не забывать, что при вводе текста в редакторе он будет выглядеть не точно так же как и на сайте. Причина в том, что на сайте используются свои стили текста, свои отступы, а у редактора свои настройки. Так что, редактируя текст тут, вы задаете только структуру и содержание (параграфы, ссылки, текст и т.п.). Ну и маленькая подсказка напоследок - кнопка Enter при редактировании переводит на новый параграф. Если нужно просто перевести строку в текущем парарафе, используйте сочетание клавиш Shift+Enter."
  # end

  # sidebar 'О контентных страницах' do
  #   para "Контентные страницы составляют основу сайта. Имея древовидную структуру страницы могут составлять любые множества разделов."
  #   para "Они могу являться как самостоятельными страницами, так и дополнениями для страниц других объектов. Например, содержанием на главной странице является содержание контентной страницы с пустым slug, а для, например, галереи с адресом /about/gallery дополнением будет страница с slug равным gallery, и родительской страницей со slug равной about."
  #   para "В качестве дополнения контентные страницы нужны для разных целей: во первых, на некоторых неконтентных страницах могут быть вставки с содержанием - они как раз для содержания страницы-дополнения. Так же контентные страницы содержат в себе SEO данные, которые будут использованы для страниц, в которых они являются дополнениями."
  # end
end