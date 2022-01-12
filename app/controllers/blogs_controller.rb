class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]
  def new
    @blog = current_user.blogs.build
  end

  def create
    @blog = current_user.blogs.biuld(blog_params)
    if @blog.save
      flash[:notice] = "ブログを投稿しました!"
      redirect_to blogs_path
    else
      render :new
    end
  end

  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      flash[:notice] = "編集しました!"
      redirect_to @blog
    else
      render :edit
    end
  end

  def confirm
  end

  def destroy
    @blog.destroy
    flash[:danger] = "ブログを削除しました!"
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end