class AddLineItemsToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :title, :string
    add_column :carts, :price, :decimal
  end
end
