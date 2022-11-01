class UsersController < ApplicationController
def manage
  @users = User.all
end

def ban
  @user = User.find(params[:id])
  if @user.access_locked?
    @user.unlock_access!
  else
    @user.lock_access!
  end
  redirect_to users_path, notice: "User access locked: #{@user.access_locked?}"
end

def createuser
  @user = User.all
end
end


