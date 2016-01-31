class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    redirect_to login_info_path
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        # format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        # format.json { head :no_content }
        # else
        # format.html { render action: 'edit' }
        # format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:photo, :name)
  end


end
