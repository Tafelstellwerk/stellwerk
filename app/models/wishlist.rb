class Wishlist < ActiveRecord::Base
  belongs_to :tafel
  belongs_to :donation_case
  has_many :wishes

  accepts_nested_attributes_for :wishes
end
