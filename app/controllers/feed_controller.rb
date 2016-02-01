class FeedController < ApplicationController

	def feed
		
	 	if !current_user then 
	      redirect_to login_path 
	    else
	      @lot = Lot.find(2)
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

	    	if params[:link] && params[:link] != ""  then
	    		@lot = Lot.new(:attachment => File.open(params[:link]), :name => current_user[:name], :uid => current_user[:uid], :description => params[:description], :faculty => params[:faculty])
	    	else
	    		@lot = Lot.new(:attachment => params[:file_source], :name => current_user[:name], :uid => current_user[:uid], :description => params[:description], :faculty => params[:faculty])
	    	end

	    	if @lot.save!
         		redirect_to feed_path, notice: "The lot #{@lot.name} has been saved for moderation."
      		else
         		redirect_to feed_path, notice: "There was a problem saving the lot #{@lot.name}. Please check all the fields."
      		end
	      #render 'upload'
	    end
  	end

end
