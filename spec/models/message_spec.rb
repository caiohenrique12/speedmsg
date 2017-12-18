require 'rails_helper'

RSpec.describe Message, type: :model do

  [:title, :text, :user_receiver_id].each do |field|
    it { is_expected.to validate_presence_of field }
  end

  it { is_expected.to belong_to(:user).class_name('User') }
  it { is_expected.to belong_to(:user_receiver).class_name('User') }

  before(:each) do
    @visualized_false = Message.find_or_create_by!(FactoryBot.attributes_for(:visualized_false))
    @visualized_true = Message.find_or_create_by!(FactoryBot.attributes_for(:visualized_true))
  end

  describe "#status_message" do
    it "visualized show 'Não Visualizado' :unlesss" do
      message = Message.find_or_create_by!(FactoryBot.attributes_for(:visualized_false))

      expect(message.status_message).to eq "Não Visualizado"
    end
    it "visualized show 'Visualizado' :if" do
      message = Message.find_or_create_by!(FactoryBot.attributes_for(:visualized_true))

      expect(message.status_message).to eq "Visualizado"
    end
  end

  describe "#change_status" do
    it "change visualized for true" do
      @visualized_false.change_status

      expect(@visualized_false.visualized).to be_truthy
    end
  end

  describe "#archive_message" do
    it "archive of message" do
      @visualized_false.archive_message

      expect(@visualized_false.archive).to be_truthy
    end
  end

  describe "#update_date_view" do
    it "update date_view for messages visualized" do
      @visualized_false.change_status

      expect(@visualized_false.date_view.strftime("%Y-%m-%d")).to eq DateTime.now.strftime("%Y-%m-%d")
    end
  end

  describe "#update_date_archived" do
    it "update date_archived for messages archived" do
      @visualized_false.archive_message

      expect(@visualized_false.date_archived.strftime("%Y-%m-%d")).to eq DateTime.now.strftime("%Y-%m-%d")
    end
  end

end
