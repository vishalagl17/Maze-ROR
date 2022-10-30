class UsersController < ApplicationController
  require 'csv'
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

def reports
  # user = User.pluck(:id, :name)
  # result= []
  # user.each do |u|
  #   data={}
  #   data['name']=u.name
  #   Post.where()
  # end

  # p = Post.all.where(user_id: u.id)


  # @post=Post.all
  @user=User.all
  @post=Post.all
  @comment=Comment.all

    # format.csv do
    #   filename = ['Users',Date.today].join(' ')
    #   send_data User.to_csv(@user),filename:,content_type: 'text/csv'
    # end
  # end
end


def postfour
  @user=User.all
  @post=Post.all
  @comment=Comment.all
end


def postwise
  @user=User.all
  @post=Post.all
  @comment=Comment.all
end

def resultxl
  respond_to do |format|
    format.html do
      @user = User.order(created_at: :desc)
    end
    format.xlsx do
      @user=User.all
      @post=Post.all
      @comment=Comment.all
      render xlsx: 'users', template: 'users/resultxl'
    end
  end
end


  def posttwoxl
    respond_to do |format|
      format.html do
        @user = User.order(created_at: :desc)
      end
      format.xlsx do
        @user=User.all
        @post=Post.all
        @comment=Comment.all
        render xlsx: 'users', template: 'users/posttwoxl'
      end
    end
  end

  def reportbodyxl
    respond_to do |format|
      format.html do
        @user = User.order(created_at: :desc)
      end
      format.xlsx do
        @user=User.all
        @post=Post.all
        @comment=Comment.all
        render xlsx: 'users', template: 'users/reportbodyxl'
      end
    end
  end

end


