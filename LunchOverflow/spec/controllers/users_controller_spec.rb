require 'rails_helper'
  describe UsersController do
    let(:user) { FactoryGirl.create :user }

    describe "#new" do

      it "assigns the todos to User.new" do
        get :new
        expect(assign(:user).to be_a_new(User))
      end
    end
  end
