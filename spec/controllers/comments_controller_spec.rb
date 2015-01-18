require 'rails_helper'

describe CommentsController do

  describe 'GET #new' do
    it "assigns a new Comment to @comment" do
      get :new
      expect(assigns(:comment)).to be_a_new(Comment)
    end
    it "renderd the :new template" do
      get :new
      expect(response).to render_template :new
    end
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