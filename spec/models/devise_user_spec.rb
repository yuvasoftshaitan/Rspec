require 'rails_helper'

# RSpec.describe DeviseUser, type: :model do
#   describe "Validations" do
#     let(:devise_user){create :devise_user}
#     it "is valid with valid attributes" do
#       expect(devise_user).to be_valid
#     end

#     it "is not valid without a name" do
#       devise_user.email = nil
#       expect(devise_user).to_not be_valid
#     end
#   end
# end

# require 'rails_helper'

# describe DeviseUser, :type => :model do

#   context "valid Factory" do
#     it "has a valid factory" do
#       expect(build(:devise_user)).to be_valid
#     end
#   end

#   context "validations" do
#     before { create(:devise_user) }

#     context "presence" do
#       it { should validate_presence_of :email }
#       it { should validate_presence_of :encrypted_password }
#     end

#     context "uniqueness" do
#       it { should validate_uniqueness_of :email }
#     end
#   end
# end