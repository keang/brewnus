require "spec_helper"

feature "account management" do
	scenario "creating new user" do
		expect{
			visit "/brewers/sign_up"
			i = FactoryGirl.build(:brewer)
			fill_in "brewer_name", with: i.name
			fill_in "brewer_password", with: i.password
			fill_in "brewer_password_confirmation", with: i.password
			click_button 'Sign up'
		}.to change(Brewer, :count).by(1)
	end

	scenario "sign in user" do
		pending "sign in"
	end
end