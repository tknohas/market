class Admins::ApplicationController < ActionController::Base
  allow_browser versions: :modern
  layout 'admins/application'
  before_action :authenticate_admin!
end
