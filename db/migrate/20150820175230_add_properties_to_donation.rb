class AddPropertiesToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :properties, :text
  end
end
