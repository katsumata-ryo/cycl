module RequestMacros
  def login_user(user)
    before(:each) do
      Warden.test_mode!
      login_as(user, scope: :user)
    end
  end
end