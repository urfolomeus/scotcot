class PortfoliosController < ApplicationController
  load_and_authorize_resource
  
  def show
    respond_to do |format|
      format.html
    end
  end
end
