class CommentsController < ApplicationController
  def create

    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params)
    #@comment.user_id = current_user.id ※ここを加えてコメントしたユーザーを出したいです

    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to picture_path(@picture), notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end


#   def update
#     @comment = Comment.find(params[:id])
#     @picture = @comment.picture
#     if @comment.update(comment_params)
#       format.html { redirect_to picture_path(@picture), notice: '投稿できませんでした...' }
#     # respond_to do |format|
#     #   format.json { render json: {}, status: :ok}
#     #   format.html 
#     # format.json { render json: {}, status: :ok}
#     # format.html 
#     #binding.pry
#     #format.js { render :index }
#    # format.html { redirect_to picture_path(@picture), notice: '投稿できませんでした...' }
#     #redirect_to :back
#     end
# end


def update
  respond_to do |format|
    @comment = Comment.find(params[:id])
    @picture = @comment.picture
    if @comment.update(comment_params)
      
      
      format.html { redirect_to "/events/#{@picture.event_id}/pictures/#{@picture.id}", notice: 'コメントの編集をしました！' }
    # format.html { redirect_to event_picture_path(event_id: @picture.event_id, picture_id: @picture.id), notice: 'コメントの編集をしました！' }
    #  format.html { redirect_back(fallback_location:event_picture_path(event_id: @picture.event_id, picture_id: @picture.id)), notice: 'コメントの編集をしました！' }
      #format.html { render :index }
    else
      format.html { render :index }
    end
  end
end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
        respond_to do |format|
          
          format.js { render :index }
          #redirect_to :back
        end
      end
  end
  


  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:picture_id, :content)
  end
end
