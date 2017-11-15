class ReplyController < ApplicationController

  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.user_id = current_user.id
    #binding.pry
    if @reply.save
      redirect_to topics_path, notice: '投稿に成功しました'

    else
      redirect_to replies_new_path(id: @reply.topic_id), alert: "投稿に失敗しました"
      #render :new, id: @reply.topic_id
    end
  end

  private
  def reply_params
    params.require(:reply).permit(:content, :topic_id)
  end

end
