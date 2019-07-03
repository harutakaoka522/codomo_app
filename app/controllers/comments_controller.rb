class CommentsController < ApplicationController
  
  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params)
    @comment.user_id = current_user.id
 
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.js { render :index, notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end


  def update
    respond_to do |format|
      @comment = Comment.find(params[:id])
      @picture = @comment.picture
      if @comment.update(comment_params)
        format.html { redirect_to "/events/#{@picture.event_id}/pictures/#{@picture.id}", notice: 'コメントの編集をしました！' }
      else
        format.html { redirect_to "/events/#{@picture.event_id}/pictures/#{@picture.id}", notice: 'コメントは更新されませんでした' }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format| 
      format.js { render :index }
      end
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:picture_id, :content)
  end
end
