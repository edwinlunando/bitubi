class AddBankInformationToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :bank_account_name, :string
    add_column :suppliers, :bank_name, :string
  end
end
