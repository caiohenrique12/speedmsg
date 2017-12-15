require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :user => nil,
      :text => "MyText",
      :message_displayed => false,
      :user_receiver_id => 1
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "input[name=?]", "message[user_id]"

      assert_select "textarea[name=?]", "message[text]"

      assert_select "input[name=?]", "message[message_displayed]"

      assert_select "input[name=?]", "message[user_receiver_id]"
    end
  end
end
