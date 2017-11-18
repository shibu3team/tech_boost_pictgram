class RepliesController < ApplicationController
    before_action :set_topic, only: [:create]

    def new
      @reply = Reply.new
    end

    def create
      @reply = Reply.new(reply_params)
      @reply.user_id = current_user.id

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

    def topic_id_nil?
      !Topic.find_by(id:@reply.topic_id)
    end

    def set_topic
      @topic = Topic.find_by(id: params[:reply][:topic_id])
      return redirect_to topics_path, alert: "投稿が存在しません" if @topic.nil?
    end

end
