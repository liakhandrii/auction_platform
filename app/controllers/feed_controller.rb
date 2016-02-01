class FeedController < ApplicationController

	def feed
	 	if !current_user then 
	      redirect_to login_path 
	    else
	      render 'feed'
	    end
  	end

  	def upload
	  	if !current_user then 
	      redirect_to login_path 
	    else
	      render 'upload'
	    end
  	end

end
