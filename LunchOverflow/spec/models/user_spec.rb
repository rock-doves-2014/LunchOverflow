require 'rails_helper'

describe User do

  describe "Database tests" do
    it { should have_db_column(:user_name).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:password_digest).of_type(:string) }
  end
end