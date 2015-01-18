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

    before :each do
     @comment = create(:comment)
    end

    it "deletes the contact" do
      expect{
          delete :destroy, id: @comment
        }.to change(Comment,:count).by(-1)
    end

    it "redirects to post page" do
    end

  end

end


# describe'GET#show'do
# it "renders the :show template for the phone" do
#     contact = create(:contact)
#     phone = create(:phone, contact: contact)
#     get :show, id: phone, contact_id: contact.id
#     expect(response).to render_template :show
#   end
# end
