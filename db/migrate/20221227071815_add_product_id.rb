class AddProductId < ActiveRecord::Migration[7.0]
  def change
  	add_reference :line_items, :cart, index: true
  	add_reference :line_items, :product, index: true
  end
end
