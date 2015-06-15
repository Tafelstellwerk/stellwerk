class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :title
      t.integer :amount

      t.timestamps
    end
  end
end
