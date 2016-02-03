class BetController < ApplicationController

  def update_bet(lot_id, user_id, bet)

  end

  def getBetByLotId
    puts params[:user_id]
    puts params[:lot_id]
    puts params[:confirmed_bet]
    render :json => response
  end



end
