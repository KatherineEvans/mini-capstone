class NewColumnStock < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :in_stock, :boolean, default: true
  end
end
