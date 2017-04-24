class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topics_path, notice: "トピックを作成しました！"
      NoviceMailer.sendmail_topic(@topic).deliver
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    @topic.update(topics_params)
    redirect_to topics_path, notice: "トピックを編集しました！"
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "トピックを削除しました！"
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  private
    def topics_params
      params.require(:topic).permit(:title, :content)
    end

end
