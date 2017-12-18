require 'rails_helper'

RSpec.describe User, type: :model do

  let(:users){
    User.find_by(email: 'carlos@speedmsg.com')|| FactoryBot.create(:carlos)
    User.find_by(email: 'felipe@speedmsg.com')|| FactoryBot.create(:felipe)
    User.find_by(email: 'pedro@speedmsg.com')|| FactoryBot.create(:pedro)
  }

  it { is_expected.to have_many(:messages).class_name('Message')}

  before(:each){
    @user_on = User.find_by(email: "caio@speedmsg.com") || FactoryBot.create(:user_on)
  }

  describe "#list_users" do
    before(:each) {
      users
    }

    it "list users for send email" do
      users = User.where.not(id: @user_on.id)

      expect(User.list_users(@user_on.id)).to eq users
    end
  end

  describe "#count_messages_receiver" do
    it "return number of message not displayed" do
      Message.find_or_create_by!(FactoryBot.attributes_for(:message_receiver))

      expect(@user_on.count_messages_receiver).to eq 1
    end
  end
end
