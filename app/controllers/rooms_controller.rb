class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  PER_PAGE = 4

  def index
    @search_query = params[:q]
    rooms = Room.search(@search_query).
        page(params[:page]).per(PER_PAGE)

      @rooms = RoomCollectionPresenter.new(rooms.most_recent, self)
  end

  def show
    room_model = Room.find(params[:id])
    @room = RoomPresenter.new(room_model, self)
  end

  def new
    @room = current_user.rooms.build
  end

  def edit
    @room = current_user.rooms.find(params[:id])
  end

  def create
    @room = current_user.rooms.build(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: t('flash.notice.room_created') }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    @room = current_user.rooms.find(params[:id])

    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: t('flash.notice.room_updated') }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room = current_user.rooms.find(params[:id])
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: t('flash.notice.room_deleted') }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:room).permit(:title, :location, :description)
  end
end
