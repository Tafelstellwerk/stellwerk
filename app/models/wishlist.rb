class Wishlist < ActiveRecord::Base
  belongs_to :tafel
  belongs_to :donation_case
end
