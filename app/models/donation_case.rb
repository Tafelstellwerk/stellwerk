class DonationCase < ActiveRecord::Base
  belongs_to :user
  has_many :donations
  accepts_nested_attributes_for :donations
  before_create :set_token

  has_paper_trail

  def get_changeset(user_signed_in)
    user_signed_in ? self.versions.last.changeset : Hash.new
  end

  def get_donations_changeset(user_signed_in)
    return Hash.new  unless user_signed_in && self.need_review == true
    self.donations.inject(Hash.new) do |memo, donation|
      memo.deep_merge(Hash[donation.id => donation.versions.last.changeset || Hash.new])
    end
  end

  def update_with_need_review_flag(params, user_signed_in)
    user_signed_in ? params.merge!(need_review: false) : params.merge!(need_review: true)
    self.update(params)
  end

  protected
    def set_token
      self.token = rand(36**8).to_s(36)
    end
end
