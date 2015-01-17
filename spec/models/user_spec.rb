require 'rails_helper'

describe User do

  describe "Database tests" do
    it { should have_db_column(:user_name).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:password_digest).of_type(:string) }
  end

  describe "Validation tests" do
    let(:blanks) { [nil, ''] }
    it { should have_secure_password }
    it { should have_valid(:user_name).when("Brian") }
    it { should_not have_valid(:user_name).when(*blanks) }
    it { should have_valid(:email).when("brian@gmail.com") }
    it { should_not have_valid(:email).when("brian@brian") }
  end

  describe "Association tests" do
    it { have_many(:posts) }
    it { have_many(:comments) }
  end
end