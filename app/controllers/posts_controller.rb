class PostsController < ApplicationController
  before_action :authenticate, only: [ :new, :create, :edit, :update, :destroy ]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post created successfully."
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Post deleted."
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  # This is the HTTP Basic Authentication
  def authenticate
    authenticate_or_request_with_http_basic("Admin Area") do |username, password|
      username == "admin" && password == "secret123"
    end
  end
end
