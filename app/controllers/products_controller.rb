class ProductsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @product = @category.product.build(product_params)
    @product.save
    redirect_to category_path(@product.category_id)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to category_path(@product.category_id)
  end
    private
  def product_params
    params.require(:product).permit(:name, :price, :category_id)
  end
end
