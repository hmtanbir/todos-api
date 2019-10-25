require "rails_helper"

RSpec.describe MobileOparatorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mobile_oparators").to route_to("mobile_oparators#index")
    end


    it "routes to #show" do
      expect(:get => "/mobile_oparators/1").to route_to("mobile_oparators#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/mobile_oparators").to route_to("mobile_oparators#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mobile_oparators/1").to route_to("mobile_oparators#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mobile_oparators/1").to route_to("mobile_oparators#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mobile_oparators/1").to route_to("mobile_oparators#destroy", :id => "1")
    end

  end
end
