class FeedbacksController < ApplicationController
  def call_me
    errorsdata = nil
    name_param_is_ok = false
    tel_param_is_ok = false

    if params[:callme]
      name_param_is_ok = params[:callme][:name] && params[:callme][:name].present?
      tel_param_is_ok = params[:callme][:tel] && params[:callme][:tel].present?
    end

    if name_param_is_ok && tel_param_is_ok
      FeedbacksMailer.call_me(params[:callme][:name], params[:callme][:tel]).deliver
    else
      errfields = []
      errfields << :name unless name_param_is_ok
      errfields << :tel unless tel_param_is_ok
      errorsdata = { error: 'Required fields are empty', error_fields: errfields }
    end

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json do
        if errorsdata
          render json: errorsdata, status: :unprocessable_entity
        else
          render json: true
        end
      end
    end
  end
end
