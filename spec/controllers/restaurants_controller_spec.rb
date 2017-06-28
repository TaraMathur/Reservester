require 'rails_helper'

describe RestaurantsController, type: :controller do |variable|
	describe "anonymous owner" do
    
	    before :each do
	      login_with nil, :owner
	    end

	    it "should be redirected when trying to make a new restaurant" do
	      get :new
	      expect(response).to redirect_to(new_owner_session_path)
	    end

	    it "should let an anonymous owner see the index" do
	      get :index
	      expect(response).to render_template(:index)
	    end
	end    
end