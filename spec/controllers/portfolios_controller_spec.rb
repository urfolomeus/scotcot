require 'spec_helper'

describe PortfoliosController do

  describe "GET 'show'" do
    before(:each) do
      @portfolio = Factory.create(:portfolio)
      contoller = mock_model(ApplicationController)
      controller.stub(:current_user).and_return(Factory.create(:owner))
    end
    
    it "should be successful" do
      get :show, :id => @portfolio.id
      response.should be_success
    end
    
    it "should get the user's portfolio" do
      Portfolio.should_receive(:find).
        with(@portfolio.id.to_s).
        and_return(@portfolio)
      get :show, :id => @portfolio.id
    end
    
    it "should display the show view" do
      get :show, :id => @portfolio.id
      response.should render_template(:show)
    end
  end
end
