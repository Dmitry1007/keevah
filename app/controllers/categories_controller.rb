class CategoriesController < ApplicationController
  def index
    @category = Category.paginate(page: params[:page], per_page: 9)
  end

  def show
    @category = Category.find(params[:id])
  end
end
