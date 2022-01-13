class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_back fallback_location: root_path, notice: "#{favorite.blog.user.name}さんのブログをお気に入りに登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_back fallback_location: root_path, notice: "#{favorite.blog.user.name}さんのブログをお気に入り解除しました"
  end
end
