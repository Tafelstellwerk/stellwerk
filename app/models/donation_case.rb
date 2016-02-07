class DonationCase < ActiveRecord::Base
  belongs_to :user
  has_many :donations, autosave: true

  has_paper_trail

end
