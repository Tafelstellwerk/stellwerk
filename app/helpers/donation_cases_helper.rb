module DonationCasesHelper
  def attribute_changed(donation, attribute)
    return false unless @donations_changeset.has_key?(donation)
    @donations_changeset[donation].has_key?(attribute)
  end
end
