require 'rails_helper'

describe Post do

  describe "Database tests" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:content).of_type(:string) }
    it { should have_db_column(:address).of_type(:string) }
  end

  describe "Validation tests" do
    let(:blanks) { [nil, ''] }
    it { should validate_presence_of(:title) }
    it { should_not have_valid(:title).when(*blanks) }
    it { should validate_presence_of(:content) }
    it { should_not have_valid(:content).when(*blanks) }
  end

  describe "Association tests" do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end
end