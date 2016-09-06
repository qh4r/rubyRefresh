class StocksController < ApplicationController

  def search
    if (stock = params[:stock])
      @stock = Stock.find_by_ticker(stock)
      @stock ||= Stock.new_from_lookup(stock)
    end

    if @stock
      # render json: @stock
      render partial: 'lookup'
    else
      render status: :not_found, nothing: true
    end
  end

end