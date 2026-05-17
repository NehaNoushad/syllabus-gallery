class RegistrationsController < ApplicationController
  allow_unauthenticated_access only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(registration_params)
    @user.admin = true if User.count.zero?     # first signup becomes the site admin
    if @user.save
      start_new_session_for @user
      redirect_to after_authentication_url, notice: "Welcome! Your account is ready."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.expect(user: [ :email_address, :password, :password_confirmation ])
  end
end
