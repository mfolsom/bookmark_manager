require 'spec_helper'

feature "User signs up" do
  scenario "while not logged in" do
    lambda { sign_up }.should change(User, :count).by(1)
    expect(page).to have_content("Welcome, barneyrubble@example.com")
    expect(User.first.email).to eq("barneyrubble@example.com")
  end
  scenario "with a password that doesn't match" do
    lambda { sign_up('fredflinstone@example.com', 'pass', 'wrong') }.should change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("sorry, your passwords don't match")
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
  
end