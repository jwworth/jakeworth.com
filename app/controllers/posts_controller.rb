# frozen_string_literal: true

class PostsController < ApplicationController
  helper_attr_accessor :older_posts, :latest_posts

  before_action :set_post_or_redirect, only: %i[show edit update]
  before_action :require_developer, except: %i[index show favorites]

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
      TwitterStatus.new(@post).post_status_to_twitter
      redirect_to @post, notice: 'Post created'
    else
      flash.now[:notice] = @post.errors.full_messages
      render :new
    end
  end

  def index
    @posts = Post.ordered.page(params[:page]).per(ENV.fetch('pagination_breakpoint'))
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated'
    else
      flash.now[:notice] = @post.errors.full_messages
      render :edit
    end
  end

  def favorites
    @posts = Post.favorites.ordered.page(params[:page]).per(ENV.fetch('pagination_breakpoint'))
    render :index
  end

  private

  def post_params
    params.require(:post).permit :title, :body, :url_slug, :favorite
  end

  def set_post_or_redirect
    @post = Post.find_by_url_slug!(params[:url_slug])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
