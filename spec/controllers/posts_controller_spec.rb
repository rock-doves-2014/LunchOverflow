require 'rails_helper'
describe PostsController do

  describe "GET #new" do
    it "renders the posts new view" do
     get :new
     expect(response).to render_template :new
    end
  end
end