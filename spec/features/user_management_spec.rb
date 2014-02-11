require 'spec_helper'

feature "User signs up" do
  scenario "while not logged in" do
    lambda { sign_up }.should change(User, :count).by(1)
    expect(page).to have_content("Welcome, barneyrubble@example.com")
    expect(User.first.email).to eq("barneyrubble@example.com")
  end

  def sign_up(email = "barneyrubble@example.com",
              password = "oranges!")
    visit 'users/new'
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button "Sign up"
  end
  
end