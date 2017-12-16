require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  let(:valid_attributes) {
    FactoryBot.attributes_for(:message_displayed_true)
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      message = Message.create! valid_attributes
      get :index
      expect(assigns(:messages)).to eq([message])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      message = Message.create! valid_attributes
      get :show, params: {id: message.to_param}
      expect(assigns(:message)).to eq(message)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(assigns(:message)).to be_a_new(Message)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      message = Message.create! valid_attributes
      get :edit, params: {id: message.to_param}
      expect(assigns(:message)).to eq(message)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Message" do
        expect {
          post :create, params: {message: valid_attributes}, session: valid_session
        }.to change(Message, :count).by(1)
      end

      it "redirects to the created message" do
        post :create, params: {message: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Message.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {message: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested message" do
        message = Message.create! valid_attributes
        put :update, params: {id: message.to_param, message: new_attributes}, session: valid_session
        message.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the message" do
        message = Message.create! valid_attributes
        put :update, params: {id: message.to_param, message: valid_attributes}, session: valid_session
        expect(response).to redirect_to(message)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        message = Message.create! valid_attributes
        put :update, params: {id: message.to_param, message: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested message" do
      message = Message.create! valid_attributes
      expect {
        delete :destroy, params: {id: message.to_param}, session: valid_session
      }.to change(Message, :count).by(-1)
    end

    it "redirects to the messages list" do
      message = Message.create! valid_attributes
      delete :destroy, params: {id: message.to_param}, session: valid_session
      expect(response).to redirect_to(messages_url)
    end
  end

end
