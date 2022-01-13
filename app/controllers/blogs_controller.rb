class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]
  def new
    @blog = current_user.blogs.build
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        flash[:notice] = "ブログを投稿しました!"
        redirect_to blogs_path
      else
        render :new
      end
    end
  end

  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def show
    @favorite = current_user.favorite_blogs.find_by(id: @blog_id)
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
    if params[:id] == "confirm"
      redirect_to blogs_path
    else
      @blog = Blog.find(params[:id])
    end
  end
end