class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :name
      t.decimal :lastprice

      t.timestamps
    end
  end
end
