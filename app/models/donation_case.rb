class DonationCase < ActiveRecord::Base
  belongs_to :user
  has_many :donations
  has_many :wishlists

  accepts_nested_attributes_for :donations
  before_create :set_token

  has_paper_trail

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

  def get_changeset(user_signed_in)
    (user_signed_in && self.need_review == true)? self.versions.last.changeset : Hash.new
  end

  def get_donations_changeset(user_signed_in)
    return Hash.new  unless user_signed_in && self.need_review == true
    self.donations.inject(Hash.new) do |memo, donation|
      memo.deep_merge(Hash[donation.id => donation.versions.last.changeset || Hash.new])
    end
  end

  def update_with_need_review_flag(params, user_signed_in)
    user_signed_in ? params.merge!(need_review: false) : params.merge!(need_review: true)
    self.update_attributes(params)
  end

  protected
    def set_token
      self.token = rand(36**8).to_s(36)
    end
end
