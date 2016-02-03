class BetController < ApplicationController

  def updateBet
    user_id = params[:user_id]
    lot_id = params[:lot_id]
    last_bet = params[:confirmed_bet]
    @bet = Bet.find_by(lot_id: lot_id)
    @bet.update_attribute(:lot_id, lot_id)
    @bet.update_attribute(:user_id, user_id)
    @bet.update_attribute(:confirmed_bet, last_bet)

    if @bet.save!
      render :json => {result: true}
    else
      render :json => {result: false}
    end
  end

end
