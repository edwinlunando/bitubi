# Product controller for list and show
class ProductsController < InheritedResources::Base

  before_action :authenticate_user!, only: [:add_to_cart]

  def index
    @categories = Category.all
    products = Product.all
    if params[:q].present?
      products = products.where('lower(name) LIKE ?', '%' + params[:q].downcase + '%')
    end
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      products = products.where('category_id = ?', params[:category_id])
    end
    @products = products.page(params[:page])
  end

  def show
    @product = Product.friendly.find(params[:id])
    @line_item = LineItem.new
  end

  def add_to_cart
    product = Product.friendly.find(params[:id])
    order = current_user.last_order
    # find item in line item
    if order.line_items.where('line_items.product_id = ?', product.id).exists?
      line_item = order.line_items.where('line_items.product_id = ?', product.id).first
      line_item.quantity += line_item_params[:quantity].to_i
    else
      line_item = LineItem.new(line_item_params)
    end

    # check line item quantity to product stock
    if line_item.quantity > product.stock
      flash[:error] = 'Stok tidak mencukupi'
      return render action: :show
    end

    line_item.order = order
    line_item.product = product
    if line_item.save
      flash[:success] = 'Berhasil masuk keranjang!'
      redirect_to keranjang_path
    else
      render action: :show
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :slug, :description)
  end

  def line_item_params
    params.require(:line_item).permit(:quantity)
  end

end
