class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:index, :show, :edit, :update, :destroy]
  before_action :access_lock, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
    @q = Event.ransack(params[:q])
    @statues = {完了: 0, 未完了: 1} 
    
    if params[:q]
      @events = @q.result(distinct: true)
    end
  end

  def show
   @pictures = @event.pictures
   @picture = @event.pictures.build
  end

  def new
    @event = Event.new
    @event.pictures.build
  end

  def edit
  end

  def create
  
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    respond_to do |format|
      if @event.save
        format.html { redirect_to action: 'index', notice: 'スケジュールを投稿しました' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'スケジュールを更新しました' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { redirect_to @event, notice: 'スケジュールを更新出来ませんでした....' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'スケジュールを削除しました' }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
  
  def event_params
    params.require(:event).permit(:title, :content, :status, :start_at, :end_at,
    pictures_attributes: [
          :id, 
          :image, 
          :image_content
        ]    
      )
  end

  def login_check
    unless user_signed_in?
      redirect_to root_path, notice: 'ログインしましょう！'
    end
  end
  
  def access_lock
    if @event.user.id != current_user.id
      redirect_to events_url, notice: 'あなたには権限がありません！'
    end
  end
end