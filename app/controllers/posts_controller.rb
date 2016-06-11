class PostsController < ApplicationController
  helper_attr_accessor :older_posts, :latest_posts

  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_developer, except: [:index, :show]

  def new
    @post = Post.new
  end

  def body_preview
    render layout: false
  end

  def slug_preview
    render layout: false
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post created'
    else
      flash.now[:notice] = @post.errors.full_messages
      render :new
    end
  end

  def index
    @posts = Post.ordered
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated'
    else
      flash.now[:notice] = @post.errors.full_messages
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
