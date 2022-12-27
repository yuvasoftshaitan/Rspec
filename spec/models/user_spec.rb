require 'rails_helper'

RSpec.describe User, :type => :model do 
  describe "Validations" do
    let(:user){create :user}
    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is not valid without a name" do
      user.name = nil
      expect(user).to_not be_valid
    end

    it "is not valid without an phone_no" do
      user.phone_no = nil
      expect(user).to_not be_valid
    end
  end
end