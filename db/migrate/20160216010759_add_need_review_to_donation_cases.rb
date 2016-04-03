class AddNeedReviewToDonationCases < ActiveRecord::Migration
  def change
    add_column :donation_cases, :need_review, :boolean
  end
end
