require "rails_helper"

RSpec.describe MessagesController, type: :routing do
  describe "routing" do

    it "routes to #inbox" do
      expect(:get => "/messages/inbox").to route_to("messages#inbox")
    end

    it "routes to #sent" do
      expect(:get => "/messages/sent").to route_to("messages#sent")
    end

    it "routes to #new" do
      expect(:get => "/messages/new").to route_to("messages#new")
    end

    it "routes to #show" do
      expect(:get => "/messages/1").to route_to("messages#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/messages").to route_to("messages#create")
    end

    it "routes to #archive" do
      expect(:put => "/messages/1/archive").to route_to("messages#archive", :id => "1")
    end

  end
end
