class DonationCase < ActiveRecord::Base
  belongs_to :user
  has_many :donations
  accepts_nested_attributes_for :donations

  has_paper_trail

end
