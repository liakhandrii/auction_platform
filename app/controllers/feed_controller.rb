class FeedController < ApplicationController

  before_action :lots, :bets, :users

  def feed
    if !current_user then
      redirect_to login_path
    else
      @lot = Lot.last
      @lots = Lot.all
      render 'feed'
    end
  end

  def upload
    if !current_user then
      redirect_to login_path
    else
      params.permit(:authenticity_token, :link, :faculty, :description)
      params.permit(:authenticity_token, :file_source, :faculty, :description)
      params.permit(:authenticity_token, :file_source, :link, :faculty)
      params.permit(:authenticity_token, :file_source, :link, :description)

      @lot = nil
      @lot = Lot.find_by uid: current_user[:uid]
      if !@lot
        if params[:link] && params[:link] != "" then
          @lot = Lot.new(:attachment => File.open(params[:link]), :name => current_user[:name], :uid => current_user[:uid], :description => params[:description], :faculty => params[:faculty])
        else
          @lot = Lot.new(:attachment => params[:file_source], :name => current_user[:name], :uid => current_user[:uid], :description => params[:description], :faculty => params[:faculty])
        end

        if @lot.save!
          createDefaultBet(@lot)
          redirect_to feed_path, notice: "The lot #{@lot.name} has been saved for moderation."
        else
          redirect_to feed_path, notice: "There was a problem saving the lot #{@lot.name}. Please check all the fields."
        end
      else
        redirect_to feed_path
      end
    end
  end

  def createDefaultBet(lot)
    @bet = Bet.create(lot_id: lot.id, confirmed_bet: 50)
  end

  private

  def bets
    @bets = Bet.all
  end

  def lots
    @lots = Lot.all
  end

  def users
    @users = User.all
  end

  helper_method :lots, :bets, :users

end
