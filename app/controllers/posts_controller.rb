class PostsController < ApplicationController
  include Authentication
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate, only: [:index, :show]

  # GET /posts
  def index
    if session[:user_id].present?
      puts "User Found!"
      @posts = Post.order('published_at DESC').all
    else
      puts "No User"
      @posts = Post.published.order('published_at DESC')
    end
    # @posts = @posts.order('id DESC').page(params[:page])
  end

  # GET /posts/slug
  def show
    @prev = @post.previous_article
    @next = @post.next_article
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/slug/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.published_at = Time.zone.now if @post.published?

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/slug
  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/slug
  def destroy
    # @post.destroy
    # respond_to do |format|
    #   format.html { redirect_to admin_posts_url, notice: 'Post was successfully destroyed.' }
    #   format.json { render :show, status: :ok, location: @post }
    # end
  end

  private

  def set_post
    @post = Post.find_by_slug(params[:id])
    raise ActiveRecord::RecordNotFound.new('Post not found') if @post.nil?
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :slug, :summary, :content, :published, :published_at)
  end
end
