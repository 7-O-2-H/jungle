class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_BASIC_AUTH_USER'].to_s, password: ENV['HTTP_BASIC_AUTH_PASSWORD'].to_s

  def show
    @products_count = Product.count
    @categories_count = Category.count
  end
end
