class AddPromocodeToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :promocode
  end
end
