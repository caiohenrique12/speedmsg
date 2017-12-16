require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  let(:valid_attributes) {
    FactoryBot.attributes_for(:message_displayed_true)
  }

  let(:invalid_attributes) {
    {text: nil}
  }

  let(:valid_session) { {} }

  before(:each) {
    @user_sender = FactoryBot.create(:user_on)
    @user_receiver = FactoryBot.create(:carlos)
    sign_in @user_sender
  }

  describe "GET #index" do
    before(:each) {
      @message = Message.create! valid_attributes
    }

    it "returns a success response to sender" do
      get :index

      expect(assigns(:send_messages)).to eq([@message])
      expect(assigns(:receive_messages)).to eq([])
    end

    it "returns a success response to receiver" do
      sign_out @user_sender
      sign_in @user_receiver

      get :index

      expect(assigns(:send_messages)).to eq([])
      expect(assigns(:receive_messages)).to eq([@message])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      message = FactoryBot.create(:message_displayed_false)
      expect(message).not_to be_message_displayed

      get :show, params: {id: message.to_param}
      
      expect(assigns(:message)).to be_message_displayed
      expect(assigns(:message)).to eq(message)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new

      expect(assigns(:send_users)).to eq([@user_receiver])
      expect(assigns(:message)).to be_a_new(Message)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Message" do
        expect {
          post :create, params: {message: valid_attributes}
        }.to change(Message, :count).by(1)
      end

      it "redirects to the created message" do
        post :create, params: {message: valid_attributes}

        expect(response).to redirect_to(messages_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {message: invalid_attributes}

        expect(response).to be_success
        expect(response).to render_template(:new)
      end
    end
  end

end
