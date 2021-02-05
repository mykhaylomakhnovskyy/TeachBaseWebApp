class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_locale
  layout 'admin'

  def index; end

  def default_url_options

    { locale: I18n.locale }

  end

  protected

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def check_admin
    redirect_to root_path, alert: 'No rights' unless current_user.admin?
  end

end
