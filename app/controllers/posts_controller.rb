class PostsController < ApplicationController

  before_filter :require_developer, except: :index

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to root_path
    else
      flash[:alert] = @post.errors.full_messages
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit :title, :body
  end
end
