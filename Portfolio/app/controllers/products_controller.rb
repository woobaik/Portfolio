class ProductsController < ApplicationController
  def index
    @products_items = Product.all
  end
end
