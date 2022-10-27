class PostsController < ApplicationController
  def index
    @posts=Post.all
    @newpost=Post.new
    @users = User.all
  end

  def show
    @post=Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # @post = Post.new(post_params)
    # @post.user = current_user
    # @post = Post.create(post_params.merge(user_id: current_user.id))
    @post = Post.create(post_params.merge(user_id: current_user.id))
    if @post.save
      redirect_to index
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity

    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!

    redirect_to root_path, status: :see_other
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id , :status)
  end

end
