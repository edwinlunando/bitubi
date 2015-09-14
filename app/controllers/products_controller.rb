class ProductsController < InheritedResources::Base

  def index
    @categories = Category.all
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.friendly.find(params[:id])
    @line_item = LineItem.new
  end

  def add_to_cart
    @product = Product.friendly.find(params[:id])
    @line_item = LineItem.new(line_item_params)
    order = current_user.get_last_order
    @line_item.order = order
    @line_item.product = @product
    if @line_item.save
      flash[:success] = 'Berhasil masuk keranjang!'
      redirect_to keranjang_path
    else
      raise
      render action: :show
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :slug, :description)
    end

    def line_item_params
      params.require(:line_item).permit(:purchase_type, :quantity)
    end
end

