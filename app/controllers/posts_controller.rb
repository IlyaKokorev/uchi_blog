class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, success: 'Статья добавлена :-)'
    else
      render :new, warning: 'Статья не добавлена :-('
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Статья обновлена :-)'
    else
      render :edit, warning: 'Статья не обновлена :-('
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Статья удалена :-('
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body)
  end
end
