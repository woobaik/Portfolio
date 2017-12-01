class ProductsController < ApplicationController
  def index
    @products_items = Product.all
  end

  def new
    @product_item = Product.new
  end

  def create
    @product_item = Product.new(take_params)

    respond_to do |format|
      if @product_item.save
        format.html {redirect_to products_path, notice: "Your portfolio item is now live."}
      else
        format.html { render :new}
      end
    end
  end
end

private
def take_params
  params.require(:product).permit(:title, :subtitle, :body)
end
