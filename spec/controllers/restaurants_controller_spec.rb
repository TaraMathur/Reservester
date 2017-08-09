require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
	describe "anonymous user" do
    
	    before :each do
	    # This simulates an anonymous user
	      login_with nil, :user
	    end

	    it "should be redirected when trying to make a new restaurant" do
	      get :new
	      expect(response).to redirect_to(new_user_session_path)
	    end

	    it "should let an anonymous user see the index" do
	      get :index
	      expect(response).to render_template(:index)
	    end
	end    
end


#RSpec.describe RestaurantsController, :type => :controller do
#  describe "anonymous user" do
#    before :each do
      # This simulates an anonymous user
#      login_with nil
#    end

#    it "should be redirected to signin" do
#      get :index
#      expect( response ).to redirect_to( new_user_session_path )
#    end
#  end
# end
