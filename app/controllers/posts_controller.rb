class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post, notice: "Post added successfully"
    else
      render 'new', notice: "Something went wrong! Try again"
    end
  end

  def show
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
