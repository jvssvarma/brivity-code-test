class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: "Post added successfully"
    else
      render 'new', notice: "Something went wrong! Try again"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "Post updated successfully"
    else
      render 'edit', notice: "Something went wrong! Try again"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post delete successfully"
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
