# -*- encoding : utf-8 -*-
ActiveAdmin.register Order do

  config.sort_order = "dlv_date_desc"
  config.batch_actions = false
  config.filters = true

  # menu priority: 1

  filter :pay_status, label: "Оплата",
                      as: :select,
                      collection: [ ["Наличными", 0],
                                    ["Онлайн (не оплачено)", 1],
                                    ["Онлайн (оплачено)", 2] ]
  filter :price
  filter :email
  filter :clt_first_name
  filter :clt_last_name
  filter :dlv_date
  filter :dlv_city, as: :select,
                    collection: ["Красноярск", "Сосновоборск", "Железногорск"]
  filter :dlv_address
  filter :created_at

  index download_links: false do
    column "#", :id
    column "Сумма", :price
    column("Оплата", :pay_status) {|order| ["Наличн", "Онлайн (неопл.)", "Онлайн (опл!)"][order.pay_status] }
    column "Клиент", :clt_first_name do |order|
      (order.clt_full_name + "<br>" + mail_to(order.clt_email)).html_safe
    end
    column("Доставка", :dlv_date) {|order| (I18n.l(order.dlv_date) + "<br>" + order.dlv_period.to_s).html_safe }
    column("Создан", :created_at) {|order| I18n.l order.created_at, format: "%d.%m.%Y %H:%M" }
    default_actions
  end

  show do |order|
    attributes_table do
      row("Вид и статус оплаты") do
        [ "Наличными при получении",
          "Онлайн (еще не оплачено)",
          "Онлайн (оплачено!)" ][order.pay_status]
      end
      row :products_price
      row :delivery_price
      row :discount_sum
      row :price

      row(:clt_email) { mail_to order.clt_email }
      row :clt_first_name
      row :clt_last_name
      row :clt_phone

      row :dlv_date
      row :dlv_period
      row :dlv_city
      row :dlv_address

      row :clt_comment
    end
    active_admin_comments
  end

  sidebar 'Дополнительные данные', only: :show do
    attributes_table_for resource do
      row :id
      row("Ссылка") {|order| link_to order.secret, order_path(order.secret), target: "_blank" }
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Стоимость заказа" do
      f.input :products_price, input_html: { style: "width: 128px" }
      f.input :delivery_price, input_html: { style: "width: 128px" }
      f.input :discount_sum, input_html: { style: "width: 128px" }
      f.input :price, input_html: { style: "width: 128px" }
    end

    f.inputs "Информация о клиенте" do
      f.input :clt_email
      f.input :clt_first_name
      f.input :clt_last_name
      f.input :clt_phone
    end
    f.inputs "Информация о доставке" do
      f.input :dlv_date
      f.input :dlv_period, as: :select,
                           include_blank: false,
                           collection: [ "c 10:00 до 14:00",
                                         "c 14:00 до 18:00",
                                         "c 18:00 до 21:00" ]
      f.input :dlv_city, as: :select,
                         include_blank: false,
                         collection: [ "Красноярск",
                                       "Сосновоборск",
                                       "Железногорск" ]
      f.input :dlv_address, input_html: { rows: 2 }
      f.input :clt_comment, input_html: { rows: 2 }
    end
    if f.object.new_record?
      f.inputs "" do
        f.input :terms_of_service, as: :boolean
      end
    end

    # f.inputs "" do
    #   unless f.object.home?
    #     f.input :title
    #     f.input :slug, hint: 'Часть URL адреса, которая обозначает эту страницу. Например для адреса `example.com/dictionary/pages/foton.html` часть `foton` - slug страницы. Больше - в <a href="http://en.wikipedia.org/wiki/Slug_(web_publishing)#Slug">Википедии</a>. Для главной страницы нужно просто оставить поле пустым.'.html_safe
    #     f.input :parent_id,
    #             as: :select,
    #             collection: content_pages_tree_ordered_collection(true, f.object, true),
    #             include_blank: true,
    #             input_html: { :class => 'chzn-select' }
    #   end
    #   unless (f.object == SiteSetting.value_of('page_of_contacts') ||
    #           f.object == SiteSetting.value_of('page_of_sertificates') ||
    #           f.object == SiteSetting.value_of('page_of_comments') )
    #     f.input :behavior_type,
    #             as: :radio,
    #             collection: ContentPage.behavior_type_variants,
    #             include_blank: false
    #     f.input :rct_page,
    #             collection: content_pages_tree_ordered_collection(false, f.object),
    #             input_html: { :class => 'chzn-select' }
    #     f.input :rct_lnk
    #   end
    #   f.input :body, input_html: { :class => ( f.object.home? ? '' : 'editor' ) }
    #   f.input :prior, hint: "Меньше значение => Раньше в списке"
    #   f.input :hided
    # end
    # f.inputs "SEO параметры" do
    #   f.input :description
    #   f.input :keywords
    # end
    f.actions
  end

  # sidebar 'Памятка', only: :edit do
  #   para "Прошу не забывать, что при вводе текста в редакторе он будет выглядеть не точно так же как и на сайте. Причина в том, что на сайте используются свои стили текста, свои отступы, а у редактора свои настройки. Так что, редактируя текст тут, вы задаете только структуру и содержание (параграфы, ссылки, текст и т.п.). Ну и маленькая подсказка напоследок - кнопка Enter при редактировании переводит на новый параграф. Если нужно просто перевести строку в текущем парарафе, используйте сочетание клавиш Shift+Enter."
  # end

  # sidebar 'О контентных страницах' do
  #   para "Контентные страницы составляют основу сайта. Имея древовидную структуру страницы могут составлять любые множества разделов."
  #   para "Они могу являться как самостоятельными страницами, так и дополнениями для страниц других объектов. Например, содержанием на главной странице является содержание контентной страницы с пустым slug, а для, например, галереи с адресом /about/gallery дополнением будет страница с slug равным gallery, и родительской страницей со slug равной about."
  #   para "В качестве дополнения контентные страницы нужны для разных целей: во первых, на некоторых неконтентных страницах могут быть вставки с содержанием - они как раз для содержания страницы-дополнения. Так же контентные страницы содержат в себе SEO данные, которые будут использованы для страниц, в которых они являются дополнениями."
  # end
end