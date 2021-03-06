class ProductsController < ApplicationController
  def index
    @products_items = Product.all
  end

  def angular
    @angular_products_items = Product.angular
  end

  def new
    @product_item = Product.new
    3.times {@product_item.technologies.build }
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


  def edit
    @product_item = Product.find(params[:id])
  end

  def update
    @product_item = Product.find(params[:id])
    respond_to do |format|
      if @product_item.update(take_params)
        format.html { redirect_to products_path, notice: "The record is successfully updated."}
      else
        format.html {render :edit}
      end
    end
  end


  def show
    @product_item = Product.find(params[:id])
  end

  def destroy
    # Perform the look up
    @product_item = Product.find(params[:id])

    # Destroy / Delete the record
    @product_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to products_path, notice: "Post was removed"}
    end
  end
private

  def take_params
    params.require(:product).permit(:title,
                                    :subtitle,
                                    :body,
                                    technologies_attributes: [:name]
                                    )
  end

end
