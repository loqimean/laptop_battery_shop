class AddLinkToImageToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :link, :string
  end
end
