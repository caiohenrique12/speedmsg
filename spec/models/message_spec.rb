require 'rails_helper'

RSpec.describe Message, type: :model do

  [:title, :text, :user_receiver_id].each do |field|
    it { is_expected.to validate_presence_of field }
  end

  it { is_expected.to belong_to(:user).class_name('User') }
  it { is_expected.to belong_to(:user_receiver).class_name('User') }

  before(:each) do
    @displayed_false = Message.find_or_create_by!(FactoryBot.attributes_for(:displayed_false))
    @displayed_true = Message.find_or_create_by!(FactoryBot.attributes_for(:displayed_true))
  end

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
      @displayed_false.change_status

      expect(@displayed_false.displayed).to be_truthy
    end
  end

  describe "#archive_message" do
    it "archive of message" do
      @displayed_false.archive_message

      expect(@displayed_false.archive).to be_truthy
    end
  end

  describe "#update_date_view" do
    it "update date_view for messages displayed" do
      @displayed_false.change_status

      expect(@displayed_false.date_view.strftime("%Y-%m-%d")).to eq DateTime.now.strftime("%Y-%m-%d")
    end
  end

end
