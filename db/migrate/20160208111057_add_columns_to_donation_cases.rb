class AddColumnsToDonationCases < ActiveRecord::Migration
  def change
    add_column :donation_cases, :company_name, :string
    add_column :donation_cases, :address, :string
    add_column :donation_cases, :plz_and_city, :string
    add_column :donation_cases, :contact_name, :string
    add_column :donation_cases, :phone, :string
    add_column :donation_cases, :email, :string
  end
end
