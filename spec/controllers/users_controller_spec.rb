require 'rails_helper'
describe UsersController do

   describe "GET #new" do

     it "assigns a new user to @user" do
       get :new
       expect(assigns(:user)).to be_a_new(User)
     end

     it "renders the :new template" do
       get :new
       expect(response).to render_template :new
     end

   end

   describe "POST #create" do
     
     context "with valid attributes" do
      
       it "creates a contact with the corret information" do
        expect {
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
       end

     end

     context "with invalid atributes" do
      
      it "does not save new user on database" do
        expect {
            post :create, user: attributes_for(:invalid_user)
         }.to_not change(User, :count)
      end
     end
   end
end
