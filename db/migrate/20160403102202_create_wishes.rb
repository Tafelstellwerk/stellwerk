class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :name
      t.string :fetch_time
      t.integer :amount
      t.references :wishlist, index: true

      t.timestamps
    end
  end
end
