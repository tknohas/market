class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :authenticate_user!
  helper_method :current_cart

  def current_cart
    current_user.cart || current_user.create_cart!
  end
end
