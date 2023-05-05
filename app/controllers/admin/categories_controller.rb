class Admin::CategoriesController < ApplicationController
    
  def index
    @categories = Category.order(id: :desc).all
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
  
    if @category.save
      redirect to [:admin, :categories], notice: 'Category created!'
    else 
      render :new
    end
  end

  private

  def categories_params
    params.require(:category).permit(
      :name
    )
  end

end
    
