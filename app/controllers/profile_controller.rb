class ProfileController < ApplicationController
  def list
    @user = User.find(params[:id])
    @allnokta = @user.nokta
  end
  def allusers
    @users = User.all
  end
end
