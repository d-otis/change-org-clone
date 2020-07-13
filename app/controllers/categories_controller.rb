class CategoriesController < ApplicationController
  def show
  	@petitions = Category.find(params[:id]).petitions

  	render "petitions/index"
  end
end
