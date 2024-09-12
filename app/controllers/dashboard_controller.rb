class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    # redirect_to single_page_app_path
  end
end
