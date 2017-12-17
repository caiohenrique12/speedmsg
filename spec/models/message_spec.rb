require 'rails_helper'

RSpec.describe Message, type: :model do

  [:title, :text, :user_receiver_id].each do |field|
    it { is_expected.to validate_presence_of field }
  end

  it { is_expected.to belong_to(:user).class_name('User') }
  it { is_expected.to belong_to(:user_receiver).class_name('User') }

  describe "#status_message" do
    it "displayed show 'Não Visualizado' :unlesss" do
      message = Message.find_or_create_by!(FactoryBot.attributes_for(:displayed_false))
      expect(message.status_message).to eq "Não Visualizado"
    end
    it "displayed show 'Visualizado' :if" do
      message = Message.find_or_create_by!(FactoryBot.attributes_for(:displayed_true))
      expect(message.status_message).to eq "Visualizado"
    end
  end

  describe "#change_status" do
    it "change displayed for true" do
      message = Message.find_or_create_by!(FactoryBot.attributes_for(:displayed_false))
      message.change_status
      expect(message.displayed).to be_truthy
    end
  end

  describe "#archive_message" do
    it "archive of message" do
      message = Message.find_or_create_by!(FactoryBot.attributes_for(:displayed_false))
      message.archive_message
      expect(message.archive).to be_truthy
    end
  end
end
