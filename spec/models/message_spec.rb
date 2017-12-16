require 'rails_helper'

RSpec.describe Message, type: :model do

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
end
