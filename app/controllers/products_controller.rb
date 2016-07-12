# Product controller for list and show
class ProductsController < InheritedResources::Base

  before_action :authenticate_user!, only: [:add_to_cart]

  def index
    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Produk', :products_path

    @categories = Category.all
    products = Product.published
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
    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Produk', :products_path

    @product = Product.friendly.published.find(params[:id])
    @line_item = LineItem.new
  end

  def vendors
    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Daftar Vendor', :vendors_path
    @vendors = User.activated.supplier.page(params[:page])
  end

  def vendor
    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Daftar Vendor', :vendors_path
    products = Product.published.where('user_id = ?', params[:id])
    @user = User.activated.find(params[:id])
    @products = products.page(params[:page])
  end

  def add_to_cart
    @product = product = Product.friendly.find(params[:id])
    order = current_user.last_order
    # find item in line item

    if order.line_items.where('line_items.product_id = ?', product.id).exists?
      @line_item = line_item = order.line_items.where('line_items.product_id = ?', product.id).first
      line_item.quantity += line_item_params[:quantity].to_i
    else
      @line_item = line_item = LineItem.new(line_item_params)
    end

    # check line item quantity to product stock
    if line_item.quantity > product.stock
      flash[:error] = 'Stok tidak mencukupi'
      return render action: :show
    end

    line_item.order = order
    line_item.product = product
    line_item.fixed_price = line_item.price_per_quantity

    # cek saldo cukup atau tidak
    # if order.total + line_item.price > current_user.credit
    #   flash[:error] = 'Saldo Anda tidak mencukupi'
    #   return render action: :show
    # end

    unless order.same_vendor?(line_item)
      flash[:error] = 'Anda hanya dapat membeli barang dari satu toko yang sama'
      return redirect_to vendor_view_path(order.suppliers.first)
    end

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
