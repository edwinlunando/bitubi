class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:name, :slug, :description)
    end
end

