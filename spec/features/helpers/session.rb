module SessionHelpers

  def sign_in(email,password)
    visit '/sessions/new'
    fill_in "email", :with => email
    fill_in "password", :with => password
    click_button "Sign in"
  end

  def sign_up(email = "barneyrubble@example.com",
              password = "oranges!",
              password_confirmation = "oranges!")
    visit 'users/new'
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end

  def give_email(email = "test@test.com")
    visit 'users/reset_password'
    fill_in "email", :with => email
    click_button "Remind me"
  end

end