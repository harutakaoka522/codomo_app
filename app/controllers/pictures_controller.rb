class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def show

  end

  def edit
    @picture = Picture.find(params[:id])
 #  @event = Event.find(@picture.event_id)
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
  # @picture = Picture.new(picture_params)
  
    respond_to do |format|
      if @picture.save
       
        format.html { redirect_to event_path(@picture.event_id), notice: '画像を投稿しました！' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|

      
      if @picture.update(picture_params)
       # binding.pry
        format.html { redirect_to event_path(@picture.event_id), notice: '投稿の編集をしました！' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@picture.event_id), notice: '写真を削除しました' }
      format.json { head :no_content }
    end
  end
      
  def confirm
    @picture = Picture.new(picture_params)
  end
      
  private
      
  def set_picture
    @picture = Picture.find(params[:id])
  end
      
  def picture_params
  #  params.require(:picture).permit(:image, :image_cache)
    params.require(:picture).permit(:image, :image_cache, :image_content).merge(event_id: params[:event_id])
  end
end
