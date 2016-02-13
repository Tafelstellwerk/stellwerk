class AddTokenToDonationCases < ActiveRecord::Migration
  def change
    add_column :donation_cases, :token, :string
  end
end
