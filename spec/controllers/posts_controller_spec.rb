require 'rails_helper'
describe PostsController do

  describe "GET #new" do
    before :each do
      session[:user_id] = true
    end
    it "renders the posts new view" do
     get :new
     expect(response).to render_template :new
    end
  end
end