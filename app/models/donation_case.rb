class DonationCase < ActiveRecord::Base
  belongs_to :user
  has_many :donations
  accepts_nested_attributes_for :donations
  before_create :set_token

  has_paper_trail

  protected
    def set_token
      self.token = rand(36**8).to_s(36)
    end
end
