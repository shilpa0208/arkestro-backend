class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token # skip csrf
  include CurrentUserConcern
  before_action :authenticate_user

  def authenticate_user
    head :unauthorized if @current_user.nil?
  end
end
