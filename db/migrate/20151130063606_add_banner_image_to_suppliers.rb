class AddBannerImageToSuppliers < ActiveRecord::Migration
  def change
    add_attachment :suppliers, :banner_image
  end
end
