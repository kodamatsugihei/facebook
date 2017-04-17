class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topics_params)
    if @topic.save
      redirect_to topics_path, notice: "トピックを作成しました！"
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
