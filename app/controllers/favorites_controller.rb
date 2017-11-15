class FavoritesController < ApplicationController

  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.topic_id = params[:topic_id]
    if topic_id_nil?
      redirect_to topics_path, alert: "投稿が存在しません"
      return
    end
    if @favorite.save
      redirect_to topics_path, notice: "お気に入りに登録しました"
    else
      redirect_to topics_path, alert: "お気に入りに登録できませんでした"
    end
  end


  private
  def topic_id_nil?
    !Topic.find_by(id:@favorite.topic_id)
  end


end
