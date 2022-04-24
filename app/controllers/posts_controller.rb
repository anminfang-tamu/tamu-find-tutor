class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index, :search]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end
  
  def search
    p params[:keyword]
    keyword = params[:keyword]
    @posts = Post.where(description: keyword).where(title: keyword).where(tutor_area: keyword).where(price: keyword).where(schedule: keyword)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.fetch(:post, {}).permit(:title, :tutor_area, :schedule, :description, :price)
    end
    
    def require_same_user
      if current_user != @post.user
        flash[:notice] = "You can only edit or delete your posts"
        redirect_to @post
      end
    end
end
