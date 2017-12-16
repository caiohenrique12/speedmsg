require 'rails_helper'

RSpec.describe Message, type: :model do

  describe "#status_message" do
    it "message_displayed show 'Não Visualizado' :unlesss" do
      message = Message.find_or_create_by!(FactoryBot.attributes_for(:message_displayed_false))
      expect(message.status_message).to eq "Não Visualizado"
    end
    it "message_displayed show 'Visualizado' :if" do
      message = Message.find_or_create_by!(FactoryBot.attributes_for(:message_displayed_true))
      expect(message.status_message).to eq "Visualizado"
    end
  end
end
