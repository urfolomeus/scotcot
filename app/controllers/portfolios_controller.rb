class PortfoliosController < ApplicationController
  def show
    @portfolio = Portfolio.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
end
