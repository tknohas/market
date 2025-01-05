class Admins::SessionsController < Devise::SessionsController
  layout 'admins/application'

  def after_sign_in_path_for(_resource)
    admins_products_path
  end

  def after_sign_out_path_for(_resource)
    new_admin_session_path
  end
end
