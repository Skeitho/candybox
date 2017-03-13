class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :code
      t.string :name
      t.binary :file

      t.timestamps null: false
    end
  end
end
