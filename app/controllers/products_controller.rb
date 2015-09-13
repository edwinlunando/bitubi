class ProductsController < InheritedResources::Base

  def index
    @categories = Category.all
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.friendly.find(params[:id])
  end

  private

    def product_params
      params.require(:product).permit(:name, :slug, :description)
    end
end

