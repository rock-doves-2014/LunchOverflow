require 'rails_helper'

describe CommentsController do

  describe 'GET #new' do
    before :each do
      session[:user_id] = true
    end

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
    it "assigns the requested comment to @comment" do
      comment = create(:comment)
      get :edit, id: comment
      expect(assigns(:comment)).to eq comment
    end

    it "renders the :edit template" do
      comment = create(:comment)
      get :edit, id: contact
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do

    context "with valid attributes" do
      it "saved the new comment in the database" do
      end

      it "redirects to posts#show" do
      end
    end

    context "with invalid attributes" do
      it "does not save the new comment in the database" do
      end

      it "re-renders the :new template" do
      end
    end

  end

  describe 'PATCH #update' do

    context "valid attributes" do
      it "locates requested @comment" do
      end

      it "changes @comment's attributes" do
      end

      it "redirects to post page with updated comment" do
      end
    end

    context "with invalid attributes" do
      it "does not change the contacts attributes" do
      end

      it "re-renders the :edit template" do
      end
    end
  end

  describe 'DELETE #destroy'do

    it "deletes the comment" do
    end

    it "redirects to post page" do
    end

  end

end