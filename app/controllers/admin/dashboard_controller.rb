class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "#{Rails.configuration.admin_credentials[:username]}", password: "#{Rails.configuration.admin_credentials[:password]}"
  def show
  end
end
