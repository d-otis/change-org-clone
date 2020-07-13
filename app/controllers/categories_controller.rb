class CategoriesController < ApplicationController
  def show
  	@category = Category.find(params[:id])
  	@petitions = @category.petitions
  end
end
