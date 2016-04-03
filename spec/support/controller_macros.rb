module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end

  def stub_user_for_helper
    # TODO: this is probably NOT the right way to do this - but couldn't find Devise::TestHelpers to do this
    # would be nice to clean this up - make it just part of the context instead of needing to be 
    # explicitly called in the :before block.
    helper.stub(:current_user) {nil}
    helper.stub(:user_signed_in?) {true}
  end
end