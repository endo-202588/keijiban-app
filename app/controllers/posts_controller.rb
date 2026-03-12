class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  before_action :require_owner, only: %i[edit update destroy]
  
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, success: "新規投稿が完了しました"
    else
      flash.now[:danger] = '新規投稿に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, success: "編集が完了しました"
    else
      flash.now[:danger] = '編集に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: "削除しました"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def require_owner
    redirect_to posts_path, danger: "権限がありません" unless @post.owned_by?(current_user)
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
