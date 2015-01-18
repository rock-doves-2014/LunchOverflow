require 'rails_helper'

describe CommentsController do

  describe 'GET #index' do
  end

  describe 'GET #show' do
    it "assigns the requested comment to @comment" do
      comment = create(:comment)
      get :show, id: comment
      expect(assigns(:comment)).to eq comment
    end
  end

  describe 'GET #new' do
  end

  describe 'GET #edit' do
  end

  describe 'POST #create' do
  end

  describe 'PATCH #update' do
  end

  describe 'DELETE #destroy' do
  end

end