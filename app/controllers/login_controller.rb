class LoginController < ApplicationController
  include CurrentUserConcern
  skip_before_action :authenticate_user

  def create
    @user = User
             .find_by(email: params["email"])
             .try(:authenticate, params["password"]) # authenticate built-in from has_secure_password

    if @user
      session[:user_id] = @user.id
      render json: {
        status: :created,
        logged_in: true,
        email: @user.email
      }
    else
      head :unauthorized
    end
  end

  def logged_in
    if @current_user
      render json: {
        loggedIn: true,
        email: @current_user.email
      }
    else
      render json: {
        loggedIn: false
      }
    end
  end

  def logout
    reset_session
    render json: {
      status:200,
      loggedOut: true
    }
  end
end
