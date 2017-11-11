class FavoritesController < ApplicationController
  before_action :authenticate_user, only:[:index, :create]

  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    if favorite.save
      redirect_to topics_path, notice: "お気に入りに登録しました"
    else
      redirect_to topics_path, alert: "お気に入りに登録できませんでした"
    end
  end

end
