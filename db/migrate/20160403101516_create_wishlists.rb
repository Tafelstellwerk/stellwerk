class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.references :tafel, index: true
      t.references :donation_case, index: true

      t.timestamps
    end
  end
end
