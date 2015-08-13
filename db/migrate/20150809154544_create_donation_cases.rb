class CreateDonationCases < ActiveRecord::Migration
  def change
    create_table :donation_cases do |t|
      t.string :title
      t.text :comment
      t.references :user, index: true

      t.timestamps
    end
  end
end
