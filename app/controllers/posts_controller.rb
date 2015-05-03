class PostsController < ApplicationController
  before_filter :set_post, only: [:show, :edit, :update]
  before_filter :require_developer, except: [:index, :show]

  def new
    @post = Post.new
  end

  def preview
    render layout: false
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post created'
      redirect_to @post
    else
      flash.now[:alert] = @post.errors.full_messages
      render :new
    end
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post updated'
      redirect_to @post
    else
      flash.now[:alert] = @post.errors.full_messages
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit :title, :body, :url_slug
  end

  def set_post
    @post = Post.find_by_url_slug!(params[:url_slug])
  end
end
