class CreateTypeProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :type_products do |t|
      t.integer :product_id
      t.integer :type_id

      t.timestamps
    end
  end
end
