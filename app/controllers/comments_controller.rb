class CommentsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic

    respond_to do |format|
      if @comment.save
        format.html {redirect_to topic_path(@topic), notice: 'コメントを投稿しました。'}
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    # @topic = @comment.topic
    # redirect_to edit_topic_comment_path(@topic,@comment)
  end

  def update
    @comment = Comment.find(params[:id])
    @topic = @comment.topic

      if @comment.update(comment_params)
        redirect_to topic_path(@topic,@comment), notice: 'コメントを編集しました。'
      else
        render :edit
      end

  end

  def destroy
    @comment = Comment.find(params[:id])
    @topic = @comment.topic

    respond_to do |format|
      if @comment.destroy
        format.html {redirect_to topic_path(@topic), notice: 'コメントを削除しました。'}
      else
        format.html { render :new }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end
end
