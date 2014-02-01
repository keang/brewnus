require "spec_helper"

feature "account management" do
	scenario "creating new user" do
		visit "/brewers/new"
		i = FactoryGirl.build(:brewer)
		fill_in "brewer_name", with: i.name
		fill_in "brewer_password", with: i.password
		fill_in "brewer_confirm_password", with: i.password
		click_button 'Sign up'
		expect(page).to have_content 'Yay'
	end

	scenario "sign in user" do
		pending "sign in"
	end
end