class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: "#{Rails.configuration.admin_credentials[:username]}", password: "#{Rails.configuration.admin_credentials[:password]}"

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    redirect_to [:admin, :categories], notice: 'Not implemented yet'
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
