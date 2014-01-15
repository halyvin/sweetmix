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
    f.actions
  end

end