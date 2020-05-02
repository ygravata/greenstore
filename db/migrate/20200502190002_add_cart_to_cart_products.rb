class AddCartToCartProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :cart_products, :cart, null: false, foreign_key: true
    remove_reference :cart_products, :user, foreign_key: true
  end
end
