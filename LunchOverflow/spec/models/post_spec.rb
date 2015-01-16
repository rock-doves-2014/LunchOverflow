require 'rails_helper'

describe Post do

  describe "Database tests" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:content).of_type(:string) }
    it { should have_db_column(:address).of_type(:string) }
  end

  describe "Validation tests" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:title) }
  end

  describe "Association tests" do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end
end