class Donation < ActiveRecord::Base
  belongs_to :donation_case, touch: true
  has_paper_trail

end
