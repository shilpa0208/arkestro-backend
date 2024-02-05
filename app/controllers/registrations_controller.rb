class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    user = User.create!(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:passwordConfirmation]
    )

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        email: user.email
      }
    else
      render json: { status: 500 }
    end
  end

  private

  def permitted_params
    params.require(:user).permit(:email, :password, :passwordConfirmation)
  end
end
