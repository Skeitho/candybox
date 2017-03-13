class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.string :description
      t.float :height
      t.float :width
      t.float :price
      t.string :sizeBase
      t.string :priceCurrency

      t.timestamps null: false
    end
  end
end
