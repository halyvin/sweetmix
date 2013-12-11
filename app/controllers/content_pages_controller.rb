# -*- encoding : utf-8 -*-
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
        render_params = {}

        if @page == contacts_page
          page_view_name = "contacts"
          @feedback_formus = FeedbackFormus.new(params[:feedback_formus] || {})
          if params[:feedback_formus] && @feedback_ok = @feedback_formus.valid?
            FeedbacksMailer.feedback(@feedback_formus).deliver
          end
        elsif @page == comments_page
          page_view_name = "comments"
        elsif @page == sertific_page
          page_view_name = "sertificates"
        end

        respond_to do |format|
          format.html { render page_view_name, render_params }
          # format.json  { render :json => @page }
        end
      else
        if @page.redirector?

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
