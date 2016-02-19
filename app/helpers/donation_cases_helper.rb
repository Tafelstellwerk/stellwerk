module DonationCasesHelper
  def attribute_changed(donation, attribute)
    return false unless @donations_changeset_hash.has_key?(donation)
    @donations_changeset_hash[donation].has_key?(attribute)
  end
end
