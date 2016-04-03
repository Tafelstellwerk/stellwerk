class AddClosedToDonationCases < ActiveRecord::Migration
  def change
    add_column :donation_cases, :closed, :boolean
    DonationCase.find_each do |f|
      f.closed = false
      f.save
    end
  end
end
