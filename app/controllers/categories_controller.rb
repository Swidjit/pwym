class CategoriesController <  ApplicationController
  def index
    @categories = Category.all
    puts @categories
  end
end