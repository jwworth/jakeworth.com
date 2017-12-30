# frozen_string_literal: true

class PostsController < ApplicationController
  helper_attr_accessor :older_posts, :latest_posts

  before_action :set_post, only: %i[show edit update]
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
    @posts = paginated(Kaminari.paginate_array(ordered_collected_posts))
  end

  def favorites
    @posts = paginated(Kaminari.paginate_array(ordered_favorites))
    render :index
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

  def paginated(array)
    array.page(params[:page]).per(ENV.fetch('pagination_breakpoint'))
  end

  def ordered_collected_posts
    (Post.all + SymlinkPost.all).sort_by(&:created_at).reverse
  end

  def ordered_favorites
    ordered_collected_posts.select(&:favorite?)
  end

  def post_params
    params.require(:post).permit :title, :body, :url_slug, :favorite
  end

  def set_post
    @post = Post.find_by_url_slug!(params[:url_slug])
  end
end
