require 'spec_helper'
include SessionHelpers

feature "User signs up" do
  scenario "while not logged in" do
    lambda { sign_up }.should change(User, :count).by(1)
    expect(page).to have_content("Welcome, barneyrubble@example.com")
    expect(User.first.email).to eq("barneyrubble@example.com")
  end
  scenario "with a password that doesn't match" do
    lambda { sign_up('fredflinstone@example.com', 'pass', 'wrong') }.should change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Sorry, your passwords don't match")
  end
  scenario "with an email that is already registered" do
    lambda {sign_up }.should change(User, :count).by(1)
    lambda {sign_up }.should change(User, :count).by(0)
    expect(page).to have_content("We already have that email.")
  end
  scenario "with invalid email address" do
    lambda { sign_up('fredflinstone', 'pass', 'pass') }.should change(User, :count).by(0)
    expect(page).to have_content("Doesn't look like an email address to me...")
  end
  scenario "without an email address" do
    visit 'users/new'
    click_button "Sign up"
    expect(page).to have_content("We need your email address")
  end
  
end