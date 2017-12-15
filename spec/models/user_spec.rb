require 'rails_helper'

RSpec.describe User, type: :model do

  let(:users){
    FactoryBot.create(:carlos)
    FactoryBot.create(:felipe)
    FactoryBot.create(:pedro)
  }

  describe "#list_users" do
    before {
      users
    }

    it "list users for send email" do
      user_on = FactoryBot.create(:user_on).id
      users = User.where.not(id: user_on)
      expect(User.list_users(user_on)).to eq users
    end
  end
end
