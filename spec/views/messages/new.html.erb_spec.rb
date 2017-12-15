require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      :user => nil,
      :text => "MyText",
      :message_displayed => false,
      :user_receiver_id => 1
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input[name=?]", "message[user_id]"

      assert_select "textarea[name=?]", "message[text]"

      assert_select "input[name=?]", "message[message_displayed]"

      assert_select "input[name=?]", "message[user_receiver_id]"
    end
  end
end
