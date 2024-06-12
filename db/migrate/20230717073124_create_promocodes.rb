class CreatePromocodes < ActiveRecord::Migration[7.0]
  def change
    create_table :promocodes do |t|
      t.string :code, null: false
      t.decimal :discount, precision: 8, scale: 2, null: false
      t.boolean :discount_is_fixed, null: false

      t.timestamps
    end

    add_index :promocodes, :code,  unique: true
  end
end
