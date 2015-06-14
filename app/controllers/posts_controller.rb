class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_developer, except: [:index, :show]

  def new
    @post = Post.new
  end

  def preview
    render layout: false
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post created'
    else
      flash.now[:alert] = @post.errors.full_messages
      render :new
    end
  end

  def index
    @latest_posts = Post.last(10)
    @older_posts = Post.offset(10)
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated'
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
