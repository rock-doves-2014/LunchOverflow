require 'rails_helper'

describe SessionsController do
  let(:user) { {user_name:"bill",email:"123456@123.com",password:"123456"} }

  describe '#create' do
    it "sets the session[user_id] to that of the user with valid credentials" do
      at = attributes_for(:session)
      user = User.create(at)
      session[:user_id] = nil
      get :create, session: at
      expect(session[:user_id]).to_not be(nil)
    end

    it "does not set the session[user_id] to that of the user with invalid credentials" do
      at = attributes_for(:invalid_session)
      user = User.create(at)
      session[:user_id] = nil
      get :create, session: at
      expect(session[:user_id]).to be(nil)
    end
  end

  describe "#destroy" do
   it "empty the current session" do
    at = attributes_for(:session)
    user = User.create(at)
    session[:user_id] = user.id
    get :destroy
    expect(session[:user_id]).to eq(nil)
   end
  end

end