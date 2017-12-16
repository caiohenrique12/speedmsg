require 'rails_helper'

RSpec.describe User, type: :model do

  let(:users){
    User.find_by(email: 'carlos@speedmsg.com')|| FactoryBot.create(:carlos)
    # User.find_or_create_by!(FactoryBot.attributes_for(:carlos))
    # User.find_or_create_by!(FactoryBot.attributes_for(:felipe))
    # User.find_or_create_by!(FactoryBot.attributes_for(:pedro))
  }

  describe "#list_users" do
    before {
      users
    }

    it "list users for send email" do
      user_on = User.find_by(email: "caio@speedmsg.com").try(:id) || FactoryBot.create(:user_on).id
      users = User.where.not(id: user_on)
      expect(User.list_users(user_on)).to eq users
    end
  end
end
