class ContentPagesController < FrontendController
  def show
    if @page.nil?
      not_found
    else
      @page.path.each {|pcp| add_breadcrumb(pcp.title, pcp.page_path) }

      contacts_page = SiteSetting.value_of 'page_of_contacts'
      sertific_page = SiteSetting.value_of 'page_of_sertificates'
      comments_page = SiteSetting.value_of 'page_of_comments'

      if [contacts_page, sertific_page, comments_page].include? @page

        page_view_name = "show"

        if @page == contacts_page
          page_view_name = "contacts"
        elsif @page == comments_page
          page_view_name = "comments"
        end

        respond_to do |format|
          format.html { render page_view_name }
          # format.json  { render :json => @page }
        end
      else
        if @page.redirector?

          SiteSetting.create!([
            {
              ident: "manager_email",
              name: "Email менеджера сайта",
              descr: "Адрес электронной почты, на который будут приходить уведомления с сайта: заказы звонков, сообщения со страницы контактов, сообщения о заказах",
              set_val: "mstrdymio@gmail.com"
            },
            {
              ident: "major_site_phone",
              name: "Главный телефон сайта",
              descr: "Телефон, который отображается в шапке сайта",
              set_val: "+7 (913) 234-1212"
            },
            {
              ident: "page_of_contacts",
              name: "Страница с контактной информацией",
              descr: "Контентная страница, на которой расположена контактная информация; на этой странице расположена форма контактных данных",
              val_type: 4
            },
            {
              ident: "page_of_sertificates",
              name: "Страница с сертификатами",
              descr: "Контентная страница, на которой расположены подарочные сертификаты",
              val_type: 4
            },
            {
              ident: "page_of_comments",
              name: "Страница с отзывами о сайте",
              descr: "Контентная страница, на которой расположены отзывы о сайте и форма добавления нового отзыва",
              val_type: 4
            }
          ])

          # Redirection
          redirect_url = root_url # by default

          case @page.behavior_type
          when 1
            if @page.has_children?
              redirect_url = @page.children.by_prior.first.page_path
            end
          when 2
            redirect_url = @page.rct_page.page_path if @page.rct_page.present?
          when 3
            redirect_url = @page.rct_lnk if @page.rct_lnk.present?
          end

          redirect_to redirect_url, status: 302
        else
          respond_to do |format|
            format.html
            # format.json  { render :json => @page }
          end
        end
      end
    end
  end
end
