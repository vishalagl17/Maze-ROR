class UsersController < ApplicationController
  def manage
    @users = User.all
  end
end