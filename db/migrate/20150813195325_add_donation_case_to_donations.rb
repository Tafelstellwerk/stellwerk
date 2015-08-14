class AddDonationCaseToDonations < ActiveRecord::Migration
  def change
    add_reference :donations, :donation_case, index: true
  end
end
