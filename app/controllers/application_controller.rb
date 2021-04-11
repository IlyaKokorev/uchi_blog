class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :danger, :warning

  def user_name
    current_user
  end
end
