class Admin::BaseController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    unless Current.user&.admin?
      if Current.user
        redirect_to root_path, alert: "Admins only."
      else
        session[:return_to_after_authenticating] = request.url
        redirect_to new_session_path, alert: "Sign in as an admin to continue."
      end
    end
  end
end
