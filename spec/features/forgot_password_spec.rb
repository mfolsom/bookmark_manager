require 'spec_helper'
include SessionHelpers

feature "User forgot password" do
  
  before(:each) do
    User.create(:email => "test@test.com",
                :password => "test",
                :password_confirmation => "test")
  end

  scenario "with known email" do
    give_email("test@test.com")
    expect(page).to have_content("Your password has been sent!")
  end
end