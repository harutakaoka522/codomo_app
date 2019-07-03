class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :update, :destroy]
  before_action :schedule_end, only: [:create]

  def index
    @pictures = Picture.all
  end

  def show 
    @comments = @picture.comments
    @comment = @picture.comments.build
  end

  def edit
    @picture = Picture.find(params[:id])
    @event = @picture.event
  end

  def new  
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @event = Event.find(params[:event_id])
      @picture = @event.pictures.build  
    end
  end

  def create
    event = Event.find(params[:event_id])
    @picture = event.pictures.build(picture_params)
      if @picture.save
        redirect_to event_path(@picture.event_id), notice: '画像を投稿しました！'
      else
        @event = Event.find(params[:event_id])
        render :new
      end
  end

  def update  
    if @picture.update(picture_params)
      redirect_to event_path(@picture.event_id), notice: '投稿の編集をしました！'
    else
      redirect_to event_path(@picture.event_id),notice: '正しく入力してください'
    end
  end

  def destroy
    @picture.destroy
      redirect_to event_path(@picture.event_id), notice: '写真を削除しました'
  end
      
  def confirm
    @picture = Picture.new(picture_params)
  end
      
  private
      
  def set_picture
    @picture = Picture.find(params[:id])
  end
      
  def picture_params
    params.require(:picture).permit(:image, :image_cache, :image_content).merge(event_id: params[:event_id])
  end

   def schedule_end
    event = Event.find(params[:event_id])
     if event.status == "未完了"
       redirect_to event, notice: 'スケジュールが未完了です！'
     end
   end
end
