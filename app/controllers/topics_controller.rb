class TopicsController < ApplicationController

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      #ログインしているユーザーのtopicを作成
      redirect_to topics_path, notice: '投稿に成功しました'
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def index
    @topics = Topic.all.includes(:favorite_users, :replies).order(created_at: :desc)
##検証用
    @replies = Reply.all

##modelに処理描く例文。scope
    @user_topics = Topic.user_topics(1)
  #

  
  end


  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
