require 'spec_helper'

describe BrewersController do
	context "CREATE new brewer" do
		it "should create a new brewer" do
			expect{
				post :create, brewer: FactoryGirl.attributes_for(:brewer)
				}.to change(Brewer, :count).by(1)
		end
	end
end
