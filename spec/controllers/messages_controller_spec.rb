require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  let(:valid_attributes) {
    FactoryBot.attributes_for(:displayed_true)
  }

  let(:invalid_attributes) {
    {text: nil}
  }

  let(:valid_session) { {} }

  before(:each) {
    @caio = FactoryBot.create(:user_on)
    @carlos = FactoryBot.create(:carlos)
    sign_in @caio
    @message = Message.create! valid_attributes
  }

  describe "GET #inbox" do
    it "return a success response to receiver" do
      sign_out @caio
      sign_in @carlos

      get :inbox

      expect(assigns(:receive_messages)).to eq([@message])
    end
  end

  describe "GET #sent" do
    it "return sent messages" do
      get :sent

      expect(assigns(:send_messages)).to eq([@message])
    end
  end

  describe "GET #show" do
    it "return incoming messages" do
      message = FactoryBot.create(:displayed_false)
      expect(message).not_to be_displayed

      get :show, params: {id: message.to_param}

      expect(assigns(:message)).to be_displayed
      expect(assigns(:message)).to eq(message)
    end
  end

  describe "GET #archives" do
    it "return archived messages" do
      sign_out @caio
      sign_in @carlos
      @message.archive_message

      get :archives

      expect(assigns(:archives)).to eq([@message])
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new

      expect(assigns(:send_users)).to eq([@carlos])
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

        expect(response).to redirect_to(inbox_messages_path)
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

  describe "POST #archive" do
    it "archive a message when receiver" do
      expect(@message).not_to be_archive

      post :archive, params: {messages: [@message.id.to_param], action_origin: "inbox_message"}

      expect(response).to redirect_to(inbox_messages_path)
    end
  end

end
